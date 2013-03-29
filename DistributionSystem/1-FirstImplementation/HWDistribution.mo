within ;
package HWDis "Hot Water Distribution Systems"
  model TwoPipes
    extends Modelica.Icons.Example;
    package Water = Buildings.Media.ConstantPropertyLiquidWater;
    parameter Real TAmb = 293.105;
    Modelica.Blocks.Tables.CombiTable1Ds InletTemp(
      tableOnFile=true,
      tableName="Temp",
      fileName="TwoPipeInletTemp.txt")
      annotation (Placement(transformation(extent={{-116,-26},{-96,-6}})));
    Modelica.Blocks.Sources.RealExpression realExpression(y=time) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-142,-16})));
    BaseClasses.TwoPipeDistributionSystem twoPipeDistributionSystem(TAmb=TAmb,
        redeclare package Water = Water)
      annotation (Placement(transformation(extent={{-76,-30},{-26,0}})));
  equation
    connect(realExpression.y, InletTemp.u) annotation (Line(
        points={{-131,-16},{-118,-16}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(InletTemp.y[1], twoPipeDistributionSystem.InletTemp) annotation (
        Line(
        points={{-95,-16},{-86.5,-16},{-86.5,-15},{-63,-15}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-200,
              -200},{200,200}}),
                        graphics), Icon(coordinateSystem(preserveAspectRatio=
              true, extent={{-200,-200},{200,200}})));
  end TwoPipes;

  model SingleFixture
    "Models the distribution system between the water heater and a single fixture.combiTable columns: 1 = mDot, 2 =TWat"
    extends Modelica.Icons.Example;
    package Water = Buildings.Media.ConstantPropertyLiquidWater;
    Modelica.Blocks.Tables.CombiTable1Ds InletConditions(
      tableOnFile=true,
      tableName="Flow",
      columns=2:3,
      fileName=
          "C:/Program Files (x86)/Dymola 2012 FD01/Models/models/modelica/WaterHeater/current/modeling/branches/pgrant/DistributionSystem/HWDisExampleDemandFlowPattern.txt")
      "Provides the hot water draw mass flow rate (Col 2) and inlet water temperature (Col 3)"
      annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
    Modelica.Blocks.Sources.RealExpression realExpression(y=time)
      annotation (Placement(transformation(extent={{-70,0},{-50,20}})));
    inner Modelica.Fluid.System system
      annotation (Placement(transformation(extent={{-62,-64},{-42,-44}})));
    BaseClasses.SinglePipeDistributionSystem singlePipeDistributionSystem(
        redeclare package Water = Water,
      pipSeg=10,
      insX=0.019,
      insK=0.01,
      pipDia=0.019,
      pipLen=10,
      T_Amb=273.105 + 20)
      annotation (Placement(transformation(extent={{16,-2},{36,18}})));
  equation
    connect(realExpression.y, InletConditions.u)
                                               annotation (Line(
        points={{-49,10},{-42,10}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(InletConditions.y[1], singlePipeDistributionSystem.mDotDra)
                                                                      annotation (
       Line(
        points={{-19,10},{-2,10},{-2,12},{14,12}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(InletConditions.y[2], singlePipeDistributionSystem.TIn)
                                                                  annotation (
        Line(
        points={{-19,10},{-2,10},{-2,6},{14,6}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(graphics));
  end SingleFixture;

  package BaseClasses
    model TwoPipeDistributionSystem
      extends Modelica.Blocks.Interfaces.BlockIcon;
      parameter Real TAmb = 293.105;
      replaceable package Water = Modelica.Media.Interfaces.PartialMedium;
      Buildings.Fluid.FixedResistances.Pipe ShowerPipe(
        thicknessIns=0.1,
        lambdaIns=2,
        length=1,
        m_flow_nominal=1e-6,
        redeclare package Medium = Water,
        diameter=0.01905,
        dp_nominal=0.01)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=0,
            origin={54,76})));
      Buildings.Fluid.FixedResistances.Pipe BranchPipe(
        thicknessIns=0.1,
        lambdaIns=2,
        length=1,
        m_flow_nominal=1e-6,
        redeclare package Medium = Water,
        diameter=0.01905,
        dp_nominal=0.01)
        annotation (Placement(transformation(extent={{-44,-20},{-24,0}})));
      Buildings.Fluid.Sources.MassFlowSource_T Shower(
        use_m_flow_in=true,
        redeclare package Medium = Water,
        use_T_in=true,
        nPorts=1)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={24,76})));
      Modelica.Blocks.Tables.CombiTable1Ds ShowerFlow(
        tableOnFile=true,
        tableName="Flow",
        fileName="TwoPipeShowerFlow.txt") annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-6,84})));
      Modelica.Blocks.Sources.Constant Constant(k=TAmb)
        annotation (Placement(transformation(extent={{-124,102},{-104,122}})));
      Buildings.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
        annotation (Placement(transformation(extent={{-92,102},{-72,122}})));
      Modelica.Blocks.Sources.RealExpression realExpression2(
                                                            y=time) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-42,84})));
      Buildings.Fluid.Sources.MassFlowSource_T Branch(
        redeclare package Medium = Water,
        use_T_in=true,
        nPorts=1,
        use_m_flow_in=true)
        annotation (Placement(transformation(extent={{-70,-20},{-50,0}})));
      Buildings.Fluid.Sources.Boundary_pT boundary3(nPorts=1, redeclare package
          Medium = Water) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={26,-10})));
      Buildings.Fluid.Sensors.Temperature senTem1(redeclare package Medium =
            Water)
        annotation (Placement(transformation(extent={{-16,2},{4,22}})));
      Buildings.Fluid.Sources.Boundary_pT boundary(nPorts=1, redeclare package
          Medium = Water) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={102,76})));
      Modelica.Blocks.Sources.RealExpression realExpression1(y=time)
        annotation (Placement(transformation(extent={{-26,-88},{-6,-68}})));
      Modelica.Blocks.Tables.CombiTable1Ds SinkFlow(
        tableOnFile=true,
        tableName="Flow",
        fileName="TwoPipeSinkFlow.txt")
        annotation (Placement(transformation(extent={{8,-88},{28,-68}})));
      Buildings.Fluid.Sources.Boundary_pT boundary4(nPorts=1, redeclare package
          Medium = Water) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={138,-86})));
      Buildings.Fluid.Sources.MassFlowSource_T Sink(
        nPorts=1,
        use_m_flow_in=true,
        use_T_in=true,
        redeclare package Medium = Water)
        annotation (Placement(transformation(extent={{44,-96},{64,-76}})));
      Buildings.Fluid.FixedResistances.Pipe SinkPipe(
        length=1,
        diameter=0.01905,
        thicknessIns=0.1,
        lambdaIns=2,
        redeclare package Medium = Water,
        m_flow_nominal=1e-6,
        dp_nominal=0.01)
        annotation (Placement(transformation(extent={{84,-96},{104,-76}})));
      Modelica.Blocks.Sources.RealExpression realExpression3(y=senTem1.T)
        annotation (Placement(transformation(extent={{-10,-114},{10,-94}})));
      Modelica.Blocks.Sources.Constant Const2(k=TAmb)
        annotation (Placement(transformation(extent={{24,-56},{44,-36}})));
      Buildings.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature1
        annotation (Placement(transformation(extent={{56,-56},{76,-36}})));
      Modelica.Blocks.Sources.RealExpression SinkFlowRate(y=SinkFlow.y[1])
        annotation (Placement(transformation(extent={{-176,24},{-156,44}})));
      Modelica.Blocks.Sources.RealExpression ShowerFlowRate(y=ShowerFlow.y[1])
        annotation (Placement(transformation(extent={{-176,68},{-156,88}})));
      Modelica.Blocks.Math.Sum sum1(nin=2)
        annotation (Placement(transformation(extent={{-126,36},{-106,56}})));
      Modelica.Blocks.Interfaces.RealInput InletTemp annotation (Placement(
            transformation(extent={{-140,-20},{-100,20}}), iconTransformation(
              extent={{-140,-20},{-100,20}})));
      Buildings.Fluid.Sensors.Temperature senTem(redeclare package Medium =
            Water)
        annotation (Placement(transformation(extent={{108,-60},{128,-40}})));
      Buildings.Fluid.Sensors.Temperature senTem2(redeclare package Medium =
            Water)
        annotation (Placement(transformation(extent={{68,84},{88,104}})));
      Modelica.Blocks.Interfaces.RealOutput TrunkOutTemp annotation (Placement(
            transformation(extent={{250,2},{270,22}}), iconTransformation(
              extent={{250,2},{270,22}})));
      Modelica.Blocks.Interfaces.RealOutput ShowerOutTemp annotation (Placement(
            transformation(extent={{250,84},{270,104}}), iconTransformation(
              extent={{100,86},{120,106}})));
      Modelica.Blocks.Interfaces.RealOutput SinkOutTemp annotation (Placement(
            transformation(extent={{250,-60},{270,-40}}), iconTransformation(
              extent={{250,-60},{270,-40}})));
      inner Modelica.Fluid.System system
        annotation (Placement(transformation(extent={{-168,-60},{-148,-40}})));
    equation
      connect(Constant.y, prescribedTemperature.T)
                                               annotation (Line(
          points={{-103,112},{-94,112}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression2.y,ShowerFlow. u) annotation (Line(
          points={{-31,84},{-18,84}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Branch.ports[1], BranchPipe.port_a)
                                               annotation (Line(
          points={{-50,-10},{-44,-10}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(BranchPipe.port_b, boundary3.ports[1])
                                               annotation (Line(
          points={{-24,-10},{16,-10}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(BranchPipe.port_b, senTem1.port)
                                         annotation (Line(
          points={{-24,-10},{-6,-10},{-6,2}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(ShowerFlow.y[1], Shower.m_flow_in)    annotation (Line(
          points={{5,84},{14,84}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(senTem1.T, Shower.T_in)    annotation (Line(
          points={{1,12},{12,12},{12,80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Shower.ports[1], ShowerPipe.port_a)
                                              annotation (Line(
          points={{34,76},{44,76}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(prescribedTemperature.port, ShowerPipe.heatPort)
                                                        annotation (Line(
          points={{-72,112},{-10,112},{-10,110},{54,110},{54,81}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(prescribedTemperature.port, BranchPipe.heatPort)
                                                         annotation (Line(
          points={{-72,112},{-64,112},{-64,20},{-34,20},{-34,-5}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(ShowerPipe.port_b, boundary.ports[1])
                                             annotation (Line(
          points={{64,76},{92,76}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(Sink.ports[1], SinkPipe.port_a)  annotation (Line(
          points={{64,-86},{84,-86}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(SinkPipe.port_b, boundary4.ports[1])
                                               annotation (Line(
          points={{104,-86},{128,-86}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(SinkFlow.y[1], Sink.m_flow_in)      annotation (Line(
          points={{29,-78},{44,-78}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression1.y,SinkFlow. u) annotation (Line(
          points={{-5,-78},{6,-78}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression3.y, Sink.T_in)      annotation (Line(
          points={{11,-104},{36,-104},{36,-82},{42,-82}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Const2.y, prescribedTemperature1.T)
                                               annotation (Line(
          points={{45,-46},{54,-46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(prescribedTemperature1.port, SinkPipe.heatPort)
                                                          annotation (Line(
          points={{76,-46},{94,-46},{94,-81}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(SinkFlowRate.y, sum1.u[1])
                                 annotation (Line(
          points={{-155,34},{-136,34},{-136,45},{-128,45}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ShowerFlowRate.y, sum1.u[2])
                                   annotation (Line(
          points={{-155,78},{-136,78},{-136,47},{-128,47}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sum1.y, Branch.m_flow_in)    annotation (Line(
          points={{-105,46},{-82,46},{-82,-2},{-70,-2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(InletTemp, Branch.T_in)    annotation (Line(
          points={{-120,0},{-108,0},{-108,-6},{-72,-6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(senTem1.T, TrunkOutTemp) annotation (Line(
          points={{1,12},{260,12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ShowerPipe.port_b, senTem2.port)
                                        annotation (Line(
          points={{64,76},{78,76},{78,84}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(senTem2.T, ShowerOutTemp) annotation (Line(
          points={{85,94},{260,94}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(SinkPipe.port_b, senTem.port)
                                        annotation (Line(
          points={{104,-86},{118,-86},{118,-60}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(senTem.T, SinkOutTemp) annotation (Line(
          points={{125,-50},{260,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{
                -250,-150},{250,150}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-250,-150},{250,150}}),
            graphics),
            defaultComponentName = "twoPip",
            Documentation(info="<html>
        <p>
        This model describes the flow through a hot water distribution system with two end uses. It assumes a trunk and branch configuration.
        </p>
        <p>
        The inlet hot water draw pattern is defined by editing text files for the two fixtures. These flows are then combined to form the draw flow rate for the branch.
        The inlet water temperature is entered into this model as a Real input. It can either come from a water heater model or an input file.
        </p>
        <p>
        The water temperature is passed from the trunk to the branches. It is also passed out of the model as a Real output so the user can observe the outlet temperature over time.
        </p>
        <p>
        The distribution system can be modified by adding additional splits in the same manner as shown. For example, a system with two sinks on the same branch could be modeled. In that case two new branches would be added. They would use text files to describe inlet flow rates. The current sink branch would be modified to use a realExpression (Sink1Flow + Sink2Flow) to describe the flow rate. The trunk branch would then have to be modified for the total flow to be (Sink1Flow + Sink2Flow + ShowerFlow). RealExpressions would also need to be used to pass the water temperature from the sink branch to the two new sink branches.
        </p>
        </html>"));
    end TwoPipeDistributionSystem;

    model SinglePipeDistributionSystem
      extends Modelica.Blocks.Interfaces.BlockIcon;
      replaceable package Water = Modelica.Media.Interfaces.PartialMedium;
      parameter Integer pipSeg = 10 "Number of segments in the pipe";
      parameter Real insX(unit="m") = 0.019 "Thickness of the pipe insulation";
      parameter Real insK(unit = "W/(m.K)") = 0.01
        "Conductivity of the insulation";
      parameter Real pipDia(unit = "m") = 0.019 "Inside diameter of the pipe";
      parameter Real pipLen(unit = "m") = 10 "Length of the pipe";
      parameter Real T_Amb(unit = "K") = 27.105 + 20 "Ambient temperature";
      Buildings.Fluid.FixedResistances.Pipe pip(
        redeclare package Medium = Water,
        T_start=273.15+16,
        nSeg=pipSeg,
        thicknessIns=insX,
        lambdaIns=insK,
        diameter=pipDia,
        length=pipLen,
        m_flow_nominal=0.1)
        annotation (Placement(transformation(extent={{18,-10},{38,10}})));
      Buildings.Fluid.Sources.MassFlowSource_T boundary(
        nPorts=1,
        use_m_flow_in=true,
        use_T_in=true,
        redeclare package Medium = Water)
        annotation (Placement(transformation(extent={{-16,-10},{4,10}})));
      Buildings.Fluid.Sources.Boundary_pT boundary1(nPorts=1, redeclare package
          Medium = Water)                                     annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={60,0})));
      Modelica.Blocks.Sources.Constant TAmb(k=T_Amb)
        annotation (Placement(transformation(extent={{-50,34},{-30,54}})));
      Buildings.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
        annotation (Placement(transformation(extent={{-20,34},{0,54}})));
      Modelica.Blocks.Interfaces.RealInput mDotDra
        "Mass flow rate of water draw"
        annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
      Modelica.Blocks.Interfaces.RealInput TIn
        "Water temperature entering the pipe"
        annotation (Placement(transformation(extent={{-140,-40},{-100,0}})));
      Buildings.Fluid.Sensors.Temperature senTem(redeclare package Medium =
            Water)
        annotation (Placement(transformation(extent={{34,16},{54,36}})));
      Modelica.Blocks.Interfaces.RealOutput TOutPip "PipeOutletTemperature"
        annotation (Placement(transformation(extent={{100,16},{120,36}})));
    equation
      connect(boundary.ports[1],pip. port_a) annotation (Line(
          points={{4,0},{18,0}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(pip.port_b,boundary1. ports[1]) annotation (Line(
          points={{38,0},{44,0},{44,1.33227e-015},{50,1.33227e-015}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(prescribedTemperature.port,pip. heatPort) annotation (Line(
          points={{4.44089e-16,44},{28,44},{28,5}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(TAmb.y,prescribedTemperature. T) annotation (Line(
          points={{-29,44},{-22,44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mDotDra, boundary.m_flow_in) annotation (Line(
          points={{-120,40},{-70,40},{-70,8},{-16,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TIn, boundary.T_in) annotation (Line(
          points={{-120,-20},{-70,-20},{-70,4},{-18,4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pip.port_b, senTem.port) annotation (Line(
          points={{38,0},{44,0},{44,16}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(senTem.T, TOutPip) annotation (Line(
          points={{51,26},{110,26}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(graphics));
    end SinglePipeDistributionSystem;
  end BaseClasses;

  package ValidationModels
    "Models designed to be the same as Carl Hillers lab setup, for use in validating the model"
    model oneHalInc "Model emulating Carl Hillers 1/2 in dia pipe experiments"
      extends Modelica.Icons.Example;
      package Water = Buildings.Media.ConstantPropertyLiquidWater;
      Modelica.Blocks.Tables.CombiTable1Ds InletConditions(
        tableOnFile=true,
        tableName="Flow",
        columns=2:3,
        fileName="HWDisExampleDemandFlowPattern.txt")
        "Provides the hot water draw mass flow rate (Col 2) and inlet water temperature (Col 3)"
        annotation (Placement(transformation(extent={{-38,2},{-18,22}})));
      Modelica.Blocks.Sources.RealExpression realExpression(y=time)
        annotation (Placement(transformation(extent={{-68,2},{-48,22}})));
      inner Modelica.Fluid.System system
        annotation (Placement(transformation(extent={{-60,-62},{-40,-42}})));
      BaseClasses.SinglePipeDistributionSystem singlePipeDistributionSystem(
          redeclare package Water = Water,
        pipDia=0.0127,
        T_Amb=273.105 + 20,
        pipSeg=6,
        pipLen=39.0144,
        insK=0.036,
        insX=0.0127)
        annotation (Placement(transformation(extent={{18,0},{38,20}})));
    equation
      connect(realExpression.y,InletConditions. u)
                                                 annotation (Line(
          points={{-47,12},{-40,12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(InletConditions.y[1],singlePipeDistributionSystem. mDotDra)
                                                                        annotation (
         Line(
          points={{-17,12},{0,12},{0,14},{16,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(InletConditions.y[2],singlePipeDistributionSystem. TIn)
                                                                    annotation (
          Line(
          points={{-17,12},{0,12},{0,8},{16,8}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
      Documentation(info="<html>
  <p>
  This model presents a single pipe model intended to match Carl Hiller's lab tests. It is intended to match the 1/2 in dia pipe tests.
  </p>
  <p>
  Useful numbers and facts:
  </p>
  <ul>
  <li> The one half inch pipe test has six straight sections of 20 ft, with elbows and shorties creating U-bends in between. Total length is 128 ft (39.0144 m).
  </li>
  <li>
  There are two options for insulation - 1/2 in and 3/4 in. 1/2 in = 0.0127 m. 3/4 in = 0.01905 m.
  </li>
  <li>
  The insulation used in Carl Hiller's test lab has a conductivity of 0.02 Btu/hr-Ft-F (0.036 W/hr-m-K).
  </li>
  </ul>
  </html>"));
    end oneHalInc;

    model thrQuaIn
      "A model designed to replicate Carl Hiller's test lab. Parameters entered are intended to match the 3/4 in dia test"
      extends Modelica.Icons.Example;

      package Water = Buildings.Media.ConstantPropertyLiquidWater;

      Modelica.Blocks.Tables.CombiTable1Ds InletConditions(
        tableOnFile=true,
        columns=2:3,
        tableName="Data",
        fileName=
            "/home/peter/WaterHeaterModeling/ExperimentalData/DistributionSystem/34CuBare1GPMTest1.txt")
        "Provides the hot water draw mass flow rate (Col 2) and inlet water temperature (Col 3)"
        annotation (Placement(transformation(extent={{-36,6},{-16,26}})));
      Modelica.Blocks.Sources.RealExpression realExpression(y=time)
        annotation (Placement(transformation(extent={{-66,6},{-46,26}})));
      inner Modelica.Fluid.System system
        annotation (Placement(transformation(extent={{-58,-58},{-38,-38}})));
      BaseClasses.SinglePipeDistributionSystem singlePipeDistributionSystem(
          redeclare package Water = Water,
        pipDia=0.019939,
        pipLen=27.87758,
        insX=0.1,
        T_Amb=273.105 + 20,
        insK=0.25,
        pipSeg=1500)
        annotation (Placement(transformation(extent={{46,4},{66,24}})));
      Modelica.Blocks.Math.Add add
        annotation (Placement(transformation(extent={{10,-20},{30,0}})));
      Modelica.Blocks.Sources.Constant const(k=273.15)
        annotation (Placement(transformation(extent={{-52,-26},{-32,-6}})));
      Modelica.Blocks.Tables.CombiTable1Ds ValidationData(
        tableOnFile=true,
        tableName="Data",
        fileName=
            "/home/peter/WaterHeaterModeling/ExperimentalData/DistributionSystem/34CuR0GPM1ValidationData.txt",
        columns=2:10)
        annotation (Placement(transformation(extent={{-36,36},{-16,56}})));

    equation
      connect(realExpression.y,InletConditions. u)
                                                 annotation (Line(
          points={{-45,16},{-38,16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(InletConditions.y[1],singlePipeDistributionSystem. mDotDra)
                                                                        annotation (
         Line(
          points={{-15,16},{2,16},{2,18},{44,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(InletConditions.y[2], add.u1) annotation (Line(
          points={{-15,16},{2,16},{2,-4},{8,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, singlePipeDistributionSystem.TIn) annotation (Line(
          points={{31,-10},{36,-10},{36,12},{44,12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(const.y, add.u2) annotation (Line(
          points={{-31,-16},{8,-16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression.y, ValidationData.u) annotation (Line(
          points={{-45,16},{-44,16},{-44,46},{-38,46}},
          color={0,0,127},
          smooth=Smooth.None));
    annotation (
    Documentation(info="<html>
<p>
This model is designed to match Carl Hiller's test lab. It is intended to be the same as the 3/4 in dia pipe setup.
</p>
<p>
Some useful numbers and facts:
</p>
<ul>
<li>
The 3/4 in dia pipe test has four straight sections of 20 ft, with elbows and shorties creating U-bends in between. Total length is 86 ft (26.2128 m).
</li>
<li>
There are two options for insulation - 1/2 in and 3/4 in. 1/2 in = 0.0127 m. 3/4 in = 0.01905 m.
</li>
<li>
The insulation used in Carl Hiller's test lab has a conductivity of 0.02 Btu/hr-Ft-F (0.036 W/hr-m-K).
</li>
</ul>
</html>"), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end thrQuaIn;
  end ValidationModels;
  annotation (uses(Modelica(version="3.2"), Buildings(version="1.4")));
end HWDis;
