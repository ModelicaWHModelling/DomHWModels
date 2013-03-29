within ;
package HWDis "Hot Water Distribution Systems"
  model TwoPipes
    extends Modelica.Icons.Example;
    package Water = Buildings.Media.ConstantPropertyLiquidWater;
    parameter Real TAmb = 293.105;
    Modelica.Blocks.Tables.CombiTable1Ds InletTemp(
      tableOnFile=true,
      tableName="Temp",
      fileName=
          "/home/peter/WaterHeaterModeling/modeling/branches/pgrant/DistributionSystem/2 - Valves/TwoPipeInletTemp.txt")
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
          "/home/peter/WaterHeaterModeling/modeling/branches/pgrant/DistributionSystem/2 - Valves/HWDisExampleDemandFlowPattern.txt")
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
        points={{-19,10},{-2,10},{-2,10.8},{14,10.8}},
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
        dp_nominal=0.000000001)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=0,
            origin={50,76})));
      Buildings.Fluid.FixedResistances.Pipe BranchPipe(
        thicknessIns=0.1,
        lambdaIns=2,
        length=1,
        m_flow_nominal=1e-6,
        redeclare package Medium = Water,
        diameter=0.01905,
        dp_nominal=0.00000001)
        annotation (Placement(transformation(extent={{-44,-20},{-24,0}})));
      Modelica.Blocks.Sources.Constant Constant(k=TAmb)
        annotation (Placement(transformation(extent={{-124,100},{-104,120}})));
      Buildings.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
        annotation (Placement(transformation(extent={{-92,100},{-72,120}})));
      Buildings.Fluid.Sources.Boundary_pT boundary(          redeclare package
          Medium = Water,
        nPorts=1,
        p=101325)         annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={230,76})));
      Buildings.Fluid.Sources.Boundary_pT boundary4(          redeclare package
          Medium = Water,
        nPorts=1,
        p=101325)         annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={230,-86})));
      Buildings.Fluid.FixedResistances.Pipe SinkPipe(
        length=1,
        diameter=0.01905,
        thicknessIns=0.1,
        lambdaIns=2,
        redeclare package Medium = Water,
        m_flow_nominal=1e-6,
        dp_nominal=0.000000001)
        annotation (Placement(transformation(extent={{40,-96},{60,-76}})));
      Modelica.Blocks.Interfaces.RealInput InletTemp annotation (Placement(
            transformation(extent={{-214,-26},{-174,14}}), iconTransformation(
              extent={{-140,-20},{-100,20}})));
      Buildings.Fluid.Sensors.Temperature senTem(redeclare package Medium =
            Water)
        annotation (Placement(transformation(extent={{70,-60},{90,-40}})));
      Buildings.Fluid.Sensors.Temperature senTem2(redeclare package Medium =
            Water)
        annotation (Placement(transformation(extent={{70,84},{90,104}})));
      Modelica.Blocks.Interfaces.RealOutput ShowerOutTemp annotation (Placement(
            transformation(extent={{250,84},{270,104}}), iconTransformation(
              extent={{100,86},{120,106}})));
      Modelica.Blocks.Interfaces.RealOutput SinkOutTemp annotation (Placement(
            transformation(extent={{250,-60},{270,-40}}), iconTransformation(
              extent={{250,-60},{270,-40}})));
      inner Modelica.Fluid.System system
        annotation (Placement(transformation(extent={{-168,-60},{-148,-40}})));
      Buildings.Fluid.Sources.Boundary_pT boundary1(
        nPorts=1,
        use_T_in=true,
        redeclare package Medium = Water,
        p=446000)
        annotation (Placement(transformation(extent={{-108,-20},{-88,0}})));
      Buildings.Fluid.Actuators.Valves.TwoWayLinear val(
        redeclare package Medium = Water,
        m_flow_nominal=0.06,
        riseTime=30)
        annotation (Placement(transformation(extent={{170,-76},{190,-96}})));
      Buildings.Fluid.Actuators.Valves.TwoWayLinear val1(redeclare package
          Medium = Water, m_flow_nominal=0.06)
        annotation (Placement(transformation(extent={{170,86},{190,66}})));
      Modelica.Blocks.Math.Min min
        annotation (Placement(transformation(extent={{140,22},{160,42}})));
      Modelica.Blocks.Math.Min min1
        annotation (Placement(transformation(extent={{138,-140},{158,-120}})));
      Modelica.Blocks.Sources.Constant const(k=1)
        annotation (Placement(transformation(extent={{100,16},{120,36}})));
      Modelica.Blocks.Sources.Constant const1(k=1)
        annotation (Placement(transformation(extent={{100,-146},{120,-126}})));
      Modelica.Blocks.Math.Gain gain(k=2.2299)
        annotation (Placement(transformation(extent={{100,46},{120,66}})));
      Modelica.Blocks.Math.Gain gain1(k=2.2299)
        annotation (Placement(transformation(extent={{100,-116},{120,-96}})));
      Modelica.Blocks.Tables.CombiTable1Ds showerFlow(
        tableOnFile=true,
        fileName=
            "/home/peter/WaterHeaterModeling/modeling/branches/pgrant/DistributionSystem/2 - Valves/TwoPipeShowerFlow.txt",

        tableName="Flow")
        annotation (Placement(transformation(extent={{60,34},{80,54}})));
      Modelica.Blocks.Tables.CombiTable1Ds sinkFlow(
        tableOnFile=true,
        tableName="Flow",
        fileName=
            "/home/peter/WaterHeaterModeling/modeling/branches/pgrant/DistributionSystem/2 - Valves/TwoPipeSinkFlow.txt")
        annotation (Placement(transformation(extent={{60,-126},{80,-106}})));
      Modelica.Blocks.Sources.RealExpression realExpression(y=time)
        annotation (Placement(transformation(extent={{24,34},{44,54}})));
      Modelica.Blocks.Sources.RealExpression realExpression1(y=time)
        annotation (Placement(transformation(extent={{22,-126},{42,-106}})));
    equation
      connect(Constant.y, prescribedTemperature.T)
                                               annotation (Line(
          points={{-103,110},{-94,110}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(prescribedTemperature.port, ShowerPipe.heatPort)
                                                        annotation (Line(
          points={{-72,110},{50,110},{50,81}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(prescribedTemperature.port, BranchPipe.heatPort)
                                                         annotation (Line(
          points={{-72,110},{-34,110},{-34,-5}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(ShowerPipe.port_b, senTem2.port)
                                        annotation (Line(
          points={{60,76},{80,76},{80,84}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(senTem2.T, ShowerOutTemp) annotation (Line(
          points={{87,94},{260,94}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(SinkPipe.port_b, senTem.port)
                                        annotation (Line(
          points={{60,-86},{80,-86},{80,-60}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(senTem.T, SinkOutTemp) annotation (Line(
          points={{87,-50},{260,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(BranchPipe.port_b, ShowerPipe.port_a) annotation (Line(
          points={{-24,-10},{20,-10},{20,76},{40,76}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(BranchPipe.port_b, SinkPipe.port_a) annotation (Line(
          points={{-24,-10},{20,-10},{20,-86},{40,-86}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(boundary1.ports[1], BranchPipe.port_a) annotation (Line(
          points={{-88,-10},{-44,-10}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(InletTemp, boundary1.T_in) annotation (Line(
          points={{-194,-6},{-110,-6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(SinkPipe.port_b, val.port_a) annotation (Line(
          points={{60,-86},{170,-86}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(val.port_b, boundary4.ports[1]) annotation (Line(
          points={{190,-86},{220,-86}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(val1.port_b, boundary.ports[1]) annotation (Line(
          points={{190,76},{220,76}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(ShowerPipe.port_b, val1.port_a) annotation (Line(
          points={{60,76},{170,76}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(const1.y, min1.u2) annotation (Line(
          points={{121,-136},{136,-136}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(const.y, min.u2) annotation (Line(
          points={{121,26},{138,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(min.y, val1.y) annotation (Line(
          points={{161,32},{180,32},{180,64}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(min1.y, val.y) annotation (Line(
          points={{159,-130},{180,-130},{180,-98}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gain1.y, min1.u1) annotation (Line(
          points={{121,-106},{128,-106},{128,-124},{136,-124}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gain.y, min.u1) annotation (Line(
          points={{121,56},{128,56},{128,38},{138,38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sinkFlow.y[1], gain1.u) annotation (Line(
          points={{81,-116},{88,-116},{88,-106},{98,-106}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(showerFlow.y[1], gain.u) annotation (Line(
          points={{81,44},{88,44},{88,56},{98,56}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression.y, showerFlow.u) annotation (Line(
          points={{45,44},{58,44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression1.y, sinkFlow.u) annotation (Line(
          points={{43,-116},{58,-116}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-250,
                -150},{250,150}}),      graphics), Icon(coordinateSystem(
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
        annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
      Buildings.Fluid.Sources.Boundary_pT boundary1(          redeclare package
          Medium = Water,
        p=101325,
        nPorts=1)                                             annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={60,0})));
      Modelica.Blocks.Sources.Constant TAmb(k=T_Amb)
        annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
      Buildings.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
        annotation (Placement(transformation(extent={{-50,60},{-30,80}})));
      Modelica.Blocks.Interfaces.RealInput mDotDra
        "Mass flow rate of water draw"
        annotation (Placement(transformation(extent={{-140,8},{-100,48}})));
      Modelica.Blocks.Interfaces.RealInput TIn
        "Water temperature entering the pipe"
        annotation (Placement(transformation(extent={{-140,-40},{-100,0}})));
      Buildings.Fluid.Sensors.Temperature senTem(redeclare package Medium =
            Water)
        annotation (Placement(transformation(extent={{-16,60},{4,80}})));
      Modelica.Blocks.Interfaces.RealOutput TOutPip "PipeOutletTemperature"
        annotation (Placement(transformation(extent={{100,60},{120,80}})));
      Buildings.Fluid.Sources.Boundary_pT boundary(
        nPorts=1,
        use_T_in=true,
        redeclare package Medium = Water,
        p=446000)
        annotation (Placement(transformation(extent={{-82,-10},{-62,10}})));
      Buildings.Fluid.Actuators.Valves.TwoWayLinear val(
        redeclare package Medium = Water,
        m_flow_nominal=0.06,
        m_flow(start=0),
        riseTime=1)
        annotation (Placement(transformation(extent={{26,-10},{46,10}})));
      Modelica.Blocks.Math.Gain gain(k=2.2299)
        annotation (Placement(transformation(extent={{-68,18},{-48,38}})));
      Modelica.Blocks.Math.Min min1
        annotation (Placement(transformation(extent={{6,24},{26,44}})));
      Modelica.Blocks.Sources.Constant const(k=1)
        annotation (Placement(transformation(extent={{-28,34},{-8,54}})));
    equation
      connect(prescribedTemperature.port,pip. heatPort) annotation (Line(
          points={{-30,70},{-30,5}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(TAmb.y,prescribedTemperature. T) annotation (Line(
          points={{-59,70},{-58,70},{-58,76},{-56,76},{-56,70},{-52,70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pip.port_b, senTem.port) annotation (Line(
          points={{-20,0},{-6,0},{-6,60}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(senTem.T, TOutPip) annotation (Line(
          points={{1,70},{110,70}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(boundary.ports[1], pip.port_a) annotation (Line(
          points={{-62,0},{-40,0}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(TIn, boundary.T_in) annotation (Line(
          points={{-120,-20},{-94,-20},{-94,4},{-84,4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pip.port_b, val.port_a) annotation (Line(
          points={{-20,0},{26,0}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(val.port_b, boundary1.ports[1]) annotation (Line(
          points={{46,0},{50,0}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(mDotDra, gain.u) annotation (Line(
          points={{-120,28},{-70,28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(min1.y, val.y) annotation (Line(
          points={{27,34},{36,34},{36,12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gain.y, min1.u2) annotation (Line(
          points={{-47,28},{4,28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(const.y, min1.u1) annotation (Line(
          points={{-7,44},{-2,44},{-2,40},{4,40}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}),
                          graphics));
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
