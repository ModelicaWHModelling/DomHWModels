within ;
package Hybrid "Provides models for hybrid water heaters"
  model HybridWH
    "Provides a model of a hybrid water heater. Based on the A.O. Smith NEXT"

    parameter Real RecircFlow = 0.12 "Flow rate of the recirculation loop";
    parameter Real EffSys = 0.85 "Efficiency of the hybrid water heater";
    parameter Real EffTankless = 0.8 "Efficiency of the tankless water heater";
    parameter Real QElePum = 50
      "Electric draw of the cricrulation pump when in use";
    parameter Integer nSegTank = 8 "Number of segments in the storage tank";
    parameter Integer nSegTankless = 4
      "Number of segments in the tankless heater";
    parameter Real TIniTank[nSegTank] = {273.105 + 52, 273.105 + 52,273.105 + 52, 273.105 + 52,273.105 + 52, 273.105 + 52,273.105 + 52, 273.105 + 52}
      "Initial temperatures of segments in the storage tank";
    parameter Integer TStatHeight = 7
      "Segment of the storage tank in which the thermostat is located";
    parameter Real TSetTank = 273.105 + 52 "Setpoint of the storage tank";
    parameter Real Deadband = 12
      "Total width of the deadband on the thermostat";
    parameter Integer RecircOutSeg = 8
      "Segment from which water leaves the tank in the recirculation loop";
    parameter Integer RecircInSeg = 1
      "Segment into which water enters the tank in the reciculation loop";
    parameter Real UATank = 30 "UA value of the storage tank";
    parameter Real CTankless = 18138.9 "Capacitance of the tankless heater";
    parameter Real UATankless = 13.6521 "UA value for the tankless heater";
    parameter Real TSetTankless = 60 "Set temperature of the tankless unit";
    parameter Real EffPilot = 0.8 "Efficiency of the pilot light";
    parameter Real QDotPilot = 0 "Heat consumption rate of pilot light";
    parameter Real QDotMax = 29307 "Heat consumption at maximum capacity";
    parameter Real EnergyDensityGas = 13500
      "Energy density of the gas being burned";
    parameter Real QDotMin = 5275 "Minimum heat rate of the tankless heater";
    parameter Real tshort = 1.5
      "Tankless start delay with a short time between draws";
    parameter Real tlong = 3
      "Tankless start delay with a long time between draws";
      parameter Real tswitch = 30 "Delay length before using tlong";
    parameter Real QActTankless = 50
      "Electric draw of the tankless unit when the fan is active";
    parameter Real QIdlTankless = 15
      "Electric draw of the tankless unit when the fan is inactive";
    parameter Real QMinDea(unit="W") = 5000
      "Deadband for the minimum heat rate control";
    package Water = Modelica.Media.Water.WaterIF97_ph "Medium model";

    HeatersUsed.HybridTankless hybridTankless(SteadyStateEff_input=EffTankless,
        nNode_input=nSegTankless,
      Capacitance_input=CTankless,
      UA_input=UATankless,
      T_Set_input=TSetTankless,
      EffPilot_input=EffPilot,
      Qdot_Pilot_input=QDotPilot,
      Qdot_Rated_input=QDotMax,
      EnergyDensityGas_input=EnergyDensityGas,
      t_short=tshort,
      t_long=tlong,
      t_switch=tswitch,
      QAct=QActTankless,
      QIdl=QIdlTankless,
      Qdot_min_input=QDotMin,
      QMinDea=QMinDea)
      annotation (Placement(transformation(extent={{-64,-8},{-44,16}})));
    HeatersUsed.SimplifiedStorageTank tan(
      nSeg=nSegTank,
      redeclare package Medium = Water,
      T_Initial=TIniTank,
      TStatHeight=TStatHeight,
      TSet=TSetTank,
      RecircOutSeg=RecircOutSeg,
      RecircInSeg=RecircInSeg,
      Deadband=Deadband,
      UA=UATank,
      EffTan=(EffSys - EffTankless)/(1 - EffTankless))
      annotation (Placement(transformation(extent={{-16,-34},{90,50}})));
    Modelica.Blocks.Interfaces.RealInput TIn
      annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
    Modelica.Blocks.Interfaces.RealInput mFloIn[nSegTank]
      annotation (Placement(transformation(extent={{-140,30},{-100,70}})));
    HeatersUsed.EditedBaseClasses.Pump pump(RecircFlow=RecircFlow) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-8,-48})));
    Modelica.Blocks.Interfaces.RealInput PowerSignal
      annotation (Placement(transformation(extent={{-140,-28},{-100,12}})));
    Modelica.Blocks.Interfaces.RealInput TAmb
      annotation (Placement(transformation(extent={{-140,0},{-100,40}})));
    Modelica.Blocks.Interfaces.RealOutput TOutDra
      annotation (Placement(transformation(extent={{100,-16},{120,4}})));
    Modelica.Blocks.Math.Add add
      annotation (Placement(transformation(extent={{54,-82},{74,-62}})));
    Modelica.Blocks.Interfaces.RealOutput QEle
      annotation (Placement(transformation(extent={{100,-82},{120,-62}})));
  equation
    connect(TIn, tan.TIn) annotation (Line(
        points={{-120,80},{46,80},{46,52.2537}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(mFloIn, tan.m_flow_in) annotation (Line(
        points={{-120,50},{-54,50},{-54,50.4098},{11.8,50.4098}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(tan.TStatSig, pump.TStatSig) annotation (Line(
        points={{92.6,-18.0195},{100,-18.0195},{100,-48},{4,-48}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pump.CircFlow, hybridTankless.DemandFlowRate) annotation (Line(
        points={{-19,-48},{-80,-48},{-80,0.64},{-66,0.64}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(PowerSignal, hybridTankless.pwrSig) annotation (Line(
        points={{-120,-8},{-93,-8},{-93,-7.04},{-66,-7.04}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TAmb, hybridTankless.AmbientTemperature) annotation (Line(
        points={{-120,20},{-78,20},{-78,14.08},{-66,14.08}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hybridTankless.T_Out, tan.TInRec) annotation (Line(
        points={{-43,7.552},{-32,7.552},{-32,-16.7902},{-18.4,-16.7902}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pump.CircFlow, tan.mFloRec) annotation (Line(
        points={{-19,-48},{-32,-48},{-32,-3.26829},{-18.2,-3.26829}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hybridTankless.QDotFlu, tan.QFluIn) annotation (Line(
        points={{-43,10.432},{-30,10.432},{-30,39.7561},{-19.6,39.7561}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TAmb, tan.TAmb) annotation (Line(
        points={{-120,20},{-82,20},{-82,25.3122},{-20.1,25.3122}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(tan.TOutDra, TOutDra) annotation (Line(
        points={{93,-5.93171},{98.5,-5.93171},{98.5,-6},{110,-6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pump.QPum, add.u1) annotation (Line(
        points={{-19,-52},{-24,-52},{-24,-66},{52,-66}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hybridTankless.QEle, add.u2) annotation (Line(
        points={{-43,-3.968},{-38,-3.968},{-38,-78},{52,-78}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(add.y, QEle) annotation (Line(
        points={{75,-72},{110,-72}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hybridTankless.InletTemperature, tan.TOutRec) annotation (Line(
        points={{-66,7.168},{-76,7.168},{-76,8},{-82,8},{-82,84},{98,84},{98,
            29.5122},{92.6,29.5122}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-150},
              {100,150}}),
                     graphics), Diagram(coordinateSystem(preserveAspectRatio=true,
            extent={{-100,-150},{100,150}}),
                                        graphics));
  end HybridWH;

  package HeatersUsed
    "Provides a package of heaters from other libraries which can be used"
    model SimplifiedStorageTank "model of a gas water heater without burner"
      import SI = Modelica.SIunits;
      import WaterHeaterLib;

      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
        "Medium in the component" annotation (choicesAllMatching=true);
      //   replaceable package MediumB = Modelica.Media.Interfaces.PartialMedium
      //     "Medium in the component" annotation (choicesAllMatching=true);

      parameter Modelica.SIunits.Temperature T_Initial[nSeg] = {273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20};

      Medium.SpecificHeatCapacity c_p=Medium.specificHeatCapacityCp(
          Medium.setState_pTX(
            Medium.p_default,
            Medium.T_default,
            Medium.X_default));

      parameter Integer nSeg(min=2) = 8 "Number of volume segments";

      ////////////////////////////////////////////////////////////////////
      //   // Assumptions

      // Initialization
      parameter Medium.AbsolutePressure p_start=Medium.p_default
        "Start value of pressure" annotation (Dialog(tab="Initialization"));
    //    parameter Medium.Temperature T_start =60+273.15 "Start value of temperature"
    //                                   annotation (Dialog(tab="Initialization"));

    //  Modelica.SIunits.Temperature T_start;

      parameter Medium.MassFraction X_start[Medium.nX]=Medium.X_default
        "Start value of mass fractions m_i/m"
        annotation (Dialog(tab="Initialization", enable=Medium.nXi > 0));
      parameter Medium.ExtraProperty C_start[Medium.nC](quantity=Medium.extraPropertiesNames)=
           fill(0, Medium.nC) "Start value of trace substances"
        annotation (Dialog(tab="Initialization", enable=Medium.nC > 0));

      parameter Integer TStatHeight = 7 "Segment the thermostat is located in";
      parameter Real TSet = 273.105 + 52 "Setpoint";
      parameter Integer RecircOutSeg "Outlet segment in the recirculation loop";
      parameter Integer RecircInSeg "Inlet segment in the recirculation loop";
      parameter Real Deadband
        "The total width of the deadband on the thermostat";
      parameter Real UA "The UA value of the storage tank";
      parameter Real EffTan = 0.25
        "Heat exhange effectiveness of the storage tank";
      parameter Real VTan = 0.15 "Volume of the tank";
      ////////////////////////////////////////////////////////////////////

      Buildings.Fluid.MixingVolumes.MixingVolume[nSeg] vol(
        redeclare each package Medium = Medium,
        each p_start=p_start,
        T_start=T_Initial[nSeg],
        each X_start=X_start,
        each C_start=C_start,
        each V=VTan/nSeg,
        nPorts=1,
        m_flow_nominal=0.001) "Tank segment"               annotation (Placement(
            transformation(
            extent={{-22,-22},{22,22}},
            rotation=90,
            origin={82,42})));

      Modelica.Blocks.Interfaces.RealVectorInput m_flow_in[nSeg] annotation (
          Placement(transformation(extent={{-178,444},{-138,484}}),
            iconTransformation(extent={{-162,444},{-122,484}})));
      EditedBaseClasses.HyDra              draHeaTra(
        nSeg=nSeg,
        redeclare package Medium = Medium)
        "Calculates the heat transfer in each segment caused by a hot water draw"
                                                                      annotation (
          Placement(transformation(
            extent={{-23,-23},{23,23}},
            rotation=-90,
            origin={-141,371})));
      Modelica.Blocks.Sources.RealExpression draHea[nSeg](y=-draHeaTra.draHeaTra)
                                                          annotation (Placement(
            transformation(
            extent={{-28,-14},{28,14}},
            rotation=180,
            origin={170,-4})));
      Buildings.HeatTransfer.Sources.PrescribedHeatFlow        prescribedHeatFlow1[
        nSeg] annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={104,-4})));
      Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor[
        nSeg] annotation (Placement(transformation(
            extent={{-17,-17},{17,17}},
            rotation=90,
            origin={-63,389})));

      Modelica.Fluid.Sources.FixedBoundary boundary[nSeg](
        nPorts=1,
        use_p=true,
        redeclare package Medium = Medium,
        p=347700) annotation (Placement(transformation(
            extent={{-21,-25},{21,25}},
            rotation=270,
            origin={131,97})));
      Modelica.Blocks.Interfaces.RealInput TIn
                                             annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={200,482})));
      Modelica.Blocks.Interfaces.IntegerOutput
                                            TStatSig
        annotation (Placement(transformation(extent={{640,-230},{692,-178}})));
      Modelica.Blocks.Interfaces.RealInput TInRec
        "Recirulation loop inlet temperature"
        annotation (Placement(transformation(extent={{-468,-216},{-420,-168}})));
      Modelica.Blocks.Interfaces.RealOutput TOutRec
        "Temperature out to the recirculation loop"
        annotation (Placement(transformation(extent={{640,234},{692,286}})));
      Modelica.Blocks.Interfaces.RealInput mFloRec "Recirculation flow rate"
        annotation (Placement(transformation(extent={{-462,-80},{-422,-40}})));
      EditedBaseClasses.cirHeaTra cirHeaTra(nSeg=nSeg,
        redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-238,-198},{-182,-142}})));
      Modelica.Blocks.Sources.RealExpression realExpression[nSeg](y=cirHeaTra.cirHeaTra)
        annotation (Placement(transformation(
            extent={{-30,-19},{30,19}},
            rotation=180,
            origin={168,-41})));
      Buildings.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow[nSeg]
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={104,-40})));
      Modelica.Blocks.Interfaces.RealInput QFluIn "Heat entering the flue"
        annotation (Placement(transformation(extent={{-492,324},{-420,396}})));
      EditedBaseClasses.fluHeaTra fluHeaTra(EffTan=EffTan, nSeg=nSeg)
        annotation (Placement(transformation(extent={{-332,336},{-284,384}})));
      Modelica.Blocks.Sources.RealExpression realExpression1[nSeg](y=fluHeaTra.fluHeaTra)
        annotation (Placement(transformation(
            extent={{-27,-16},{27,16}},
            rotation=180,
            origin={169,-80})));
      Buildings.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow2[nSeg]
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={104,-80})));
      EditedBaseClasses.UALoss uALoss(nSeg=nSeg, UA=UA)
        annotation (Placement(transformation(extent={{-314,204},{-270,248}})));
      Modelica.Blocks.Sources.RealExpression realExpression2[nSeg](y=-uALoss.UALoss)
        annotation (Placement(transformation(
            extent={{-24,-13},{24,13}},
            rotation=180,
            origin={168,-111})));
      Buildings.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow3[
        nSeg] annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={104,-110})));
      Modelica.Blocks.Interfaces.RealInput TAmb
        annotation (Placement(transformation(extent={{-502,178},{-420,260}})));
      Modelica.Blocks.Interfaces.RealOutput TOutDra
        "Temperature of water going to the draw"
        annotation (Placement(transformation(extent={{640,-116},{700,-56}})));
      Modelica.Blocks.Sources.RealExpression realExpression3(y=vol[TStatHeight].T)
        annotation (Placement(transformation(extent={{172,-274},{232,-214}})));
      Modelica.Blocks.Sources.Constant Setpoint(k=TSet)
        annotation (Placement(transformation(extent={{190,-184},{228,-146}})));
      Modelica.Blocks.Logical.OnOffController onOffController(bandwidth=Deadband)
        annotation (Placement(transformation(extent={{314,-224},{358,-180}})));
      Modelica.Blocks.Math.BooleanToInteger booleanToInteger
        annotation (Placement(transformation(extent={{404,-226},{448,-182}})));
    equation

      TOutRec = vol[RecircOutSeg].T;
      TOutDra = vol[1].T;

      connect(m_flow_in, draHeaTra.mFloIn) annotation (Line(
          points={{-158,464},{-152.5,464},{-152.5,398.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(draHea.y, prescribedHeatFlow1.Q_flow) annotation (Line(
          points={{139.2,-4},{132.9,-4},{132.9,-4},{126.6,-4},{126.6,-4},{114,
              -4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(prescribedHeatFlow1.port, vol.heatPort) annotation (Line(
          points={{94,-4},{82,-4},{82,20}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(vol.heatPort, temperatureSensor.port) annotation (Line(
          points={{82,20},{-24,20},{-24,234},{-63,234},{-63,372}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(temperatureSensor.T, draHeaTra.TWat) annotation (Line(
          points={{-63,406},{-63,428},{-124.44,428},{-124.44,398.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vol.ports[1], boundary.ports[1]) annotation (Line(
          points={{104,42},{131,42},{131,76}},
          color={0,127,255},
          smooth=Smooth.None));

      connect(draHeaTra.TIn, TIn) annotation (Line(
          points={{-133.64,398.6},{-133.64,448},{200,448},{200,482}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mFloRec, cirHeaTra.mFloCir) annotation (Line(
          points={{-442,-60},{-344,-60},{-344,-170},{-243.6,-170}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(temperatureSensor.T, cirHeaTra.TWat) annotation (Line(
          points={{-63,406},{-64,406},{-64,416},{-94,416},{-94,-78},{-278,-78},{-278,
              -147.6},{-243.6,-147.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TInRec, cirHeaTra.TRec) annotation (Line(
          points={{-444,-192},{-344,-192},{-344,-192.4},{-243.6,-192.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression.y, prescribedHeatFlow.Q_flow) annotation (Line(
          points={{135,-41},{125.5,-41},{125.5,-40},{114,-40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(prescribedHeatFlow.port, vol.heatPort) annotation (Line(
          points={{94,-40},{82,-40},{82,20}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(QFluIn, fluHeaTra.QDotFlu) annotation (Line(
          points={{-456,360},{-336.8,360}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression1.y, prescribedHeatFlow2.Q_flow) annotation (Line(
          points={{139.3,-80},{114,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(prescribedHeatFlow2.port, vol.heatPort) annotation (Line(
          points={{94,-80},{82,-80},{82,20}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(temperatureSensor.T, uALoss.TWat) annotation (Line(
          points={{-63,406},{-64,406},{-64,418},{-92,418},{-92,274},{-340,274},
              {-340,234.8},{-318.4,234.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression2.y, prescribedHeatFlow3.Q_flow) annotation (Line(
          points={{141.6,-111},{129.8,-111},{129.8,-110},{114,-110}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(prescribedHeatFlow3.port, vol.heatPort) annotation (Line(
          points={{94,-110},{88,-110},{88,-108},{82,-108},{82,20}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(TAmb, uALoss.TAmb) annotation (Line(
          points={{-461,219},{-391.5,219},{-391.5,221.82},{-318.4,221.82}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(onOffController.y, booleanToInteger.u) annotation (Line(
          points={{360.2,-202},{379.9,-202},{379.9,-204},{399.6,-204}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(booleanToInteger.y, TStatSig) annotation (Line(
          points={{450.2,-204},{666,-204}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(Setpoint.y, onOffController.reference) annotation (Line(
          points={{229.9,-165},{280,-165},{280,-188.8},{309.6,-188.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression3.y, onOffController.u) annotation (Line(
          points={{235,-244},{274,-244},{274,-215.2},{309.6,-215.2}},
          color={0,0,127},
          smooth=Smooth.None));
                                                                  annotation (
          Placement(transformation(extent={{322,444},{362,484}}),
            iconTransformation(extent={{322,444},{362,484}})),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-420,-360},
                {640,460}}),graphics),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-420,-360},{640,
                460}}), graphics={Bitmap(
              extent={{-336,514},{534,-360}},
              imageSource=
                  "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",
              fileName="C:/Documents and Settings/user/Desktop/waterheater.jpg")}),
        defaultComponentName="tan",
        Documentation(info="<html>
<p>
This is a model of a water heater tank.
The tank uses several volumes to model the stratification.
Heat conduction is modeled between between the volumes and the ambient.
The port <code>heaPorVol</code> may be used to connect a temperature sensor
that measures the fluid temperature of an individual volume. It may also
be used to add heat to individual volumes.
</p>
<p>
The tank has <code>nSeg</code> fluid volumes. The top volume has the index <code>1</code>.
Thus, to add a heating element to the bottom element, connect a heat input to
<code>heaPorVol[nSeg]</code>.
</p>
<p>
The heat ports outside the tank insulation can be 
used to specify an ambient temperature.
Leave these ports unconnected to force adiabatic boundary conditions.
Note, however, that all heat conduction elements through the tank wall (but not the top and bottom) are connected to the 
heat port <code>heaPorSid</code>. Thus, not connecting
<code>heaPorSid</code> means an adiabatic boundary condition in the sense 
that <code>heaPorSid.Q_flow = 0</code>. This, however, still allows heat to flow
through the tank walls, modelled by <code>conWal</code>, from one fluid volume
to another one.
</p>
</html>",   revisions="<html>
<ul>
<li>
September 01, 2011 by Thierry S. Nouidui:<br>
First implementation.
</li>
</ul>
</html>"),
        Icon(graphics={Rectangle(
                extent={{-40,60},{40,20}},
                lineColor={255,0,0},
                fillColor={255,0,0},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{-40,-20},{40,-60}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{-76,2},{-90,-2}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{0,84},{-80,80}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{-76,84},{-80,-2}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{82,0},{78,-86}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{0,84},{-4,60}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{82,-84},{2,-88}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{6,-60},{2,-84}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{92,2},{78,-2}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{-40,20},{40,-20}},
                lineColor={255,0,0},
                pattern=LinePattern.None,
                fillColor={0,0,127},
                fillPattern=FillPattern.CrossDiag),Text(
                extent={{100,106},{134,74}},
                lineColor={0,0,127},
                textString="QLoss"),Rectangle(
                extent={{-10,10},{10,-10}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={255,255,255}),Rectangle(
                extent={{50,68},{40,-66}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={255,255,0},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{-40,66},{-50,-68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={255,255,0},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{-48,68},{50,60}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={255,255,0},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{-48,-60},{50,-68}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                fillColor={255,255,0},
                fillPattern=FillPattern.Solid),Line(
                points={{26,72},{102,72},{100,72}},
                color={127,0,0},
                pattern=LinePattern.Dot),Line(
                points={{56,6},{56,72},{58,72}},
                color={127,0,0},
                pattern=LinePattern.Dot),Line(
                points={{22,-74},{70,-74},{70,72}},
                color={127,0,0},
                pattern=LinePattern.Dot)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics));
    end SimplifiedStorageTank;

    model HybridTankless

      EditedBaseClasses.HybridTanklessHX               HeatExchanger(
        ConductionCoefficient=0.000001,
        Capacitance=Capacitance_input,
        SteadyStateEff=SteadyStateEff_input,
        UA=UA_input,
        T_Set=T_Set_input,
        nNode=nNode_input,
        EffPilot=EffPilot_input,
        Qdot_Pilot=Qdot_Pilot_input,
        Qdot_Rated=Qdot_Rated_input,
        SpecificHeat=SpecificHeat_input,
        EnergyDensityGas=EnergyDensityGas_input)
        annotation (Placement(transformation(extent={{-26,-20},{24,42}})));
      EditedBaseClasses.NonModulating                                   nonCondensingTanklessHXController(
        mdot_min_cons=mdot_min_input,
        SpecificHeat_cons=SpecificHeat_input,
        SteadyStateEff_cons=SteadyStateEff_input,
        T_Set_cons=T_Set_input,
        Qdot_min_cons=Qdot_min_input,
        QMinDea=QMinDea)
        "A controller intended to mimic the control logic used in non-condensing tankless water heaters. Includes logic to avoid firing when the flow rate is too low or the require heat rate is too low. Also includes logic to reduce the flow rate when the required heat rate surpasses the heaters maximum heat rate"
        annotation (Placement(transformation(extent={{0,-112},{20,-92}})));

      Modelica.Blocks.Interfaces.RealInput DemandFlowRate
        annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
      Modelica.Blocks.Interfaces.RealInput AmbientTemperature
        annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
      Modelica.Blocks.Interfaces.RealInput InletTemperature
        annotation (Placement(transformation(extent={{-140,-12},{-100,28}})));
      Modelica.Blocks.Interfaces.RealInput pwrSig
        annotation (Placement(transformation(extent={{-140,-160},{-100,-120}})));

      parameter Real Capacitance_input = 18138.9;
      parameter Real SteadyStateEff_input=0.83;
      parameter Real UA_input=13.6521;
      parameter Real T_Set_input = 60;
      parameter Real mdot_min_input = 0.043;
      parameter Real SpecificHeat_input = 4190;
      parameter Integer nNode_input = 10;
      parameter Real EffPilot_input = 0.8;
      parameter Real Qdot_Pilot_input = 0;
      parameter Real Qdot_Rated_input = 55555;
      parameter Real EnergyDensityGas_input = 13500;
      parameter Real Qdot_min_input = 5275;
      parameter Modelica.SIunits.Time t_short = 1.5
        "Start delay with a short time between draws";
      parameter Modelica.SIunits.Time t_long = 3
        "Start delay with a long time between draws";
      parameter Modelica.SIunits.Time t_switch = 30
        "Time between draws required for t_long";
      parameter Real QAct = 50
        "Electric power consumed when the fan is operating";
      parameter Real QIdl = 15
        "Electric power consumed when the fan is not operating";
      parameter Real QMinDea(unit = "W") = 5000
        "Deadband for the minimum heat rate";

      Modelica.Blocks.Interfaces.RealOutput T_Out
        annotation (Placement(transformation(extent={{100,2},{120,22}})));
      Modelica.Blocks.Interfaces.RealOutput QEle
        annotation (Placement(transformation(extent={{100,-118},{120,-98}})));
      Modelica.Blocks.Interfaces.RealOutput QDotFlu
        annotation (Placement(transformation(extent={{100,32},{120,52}})));
    equation
      connect(nonCondensingTanklessHXController.mdot_water_controlled,
        HeatExchanger.mdot_water) annotation (Line(
          points={{20.8727,-95.28},{20.8727,-71.05},{-31,-71.05},{-31,11}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(nonCondensingTanklessHXController.ControlConstant,HeatExchanger. ControlConstant)
        annotation (Line(
          points={{15.5636,-104.64},{38,-104.64},{38,-52},{1,-52},{1,-26.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(nonCondensingTanklessHXController.T_out,HeatExchanger. T_Out)
        annotation (Line(
          points={{-1.45455,-102.24},{-1.45455,-124},{40,-124},{40,11},{28.5,11}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(DemandFlowRate, nonCondensingTanklessHXController.mdot_water)
        annotation (Line(
          points={{-120,-60},{-60,-60},{-60,-95.2},{-1.45455,-95.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(InletTemperature, HeatExchanger.T_Inlet) annotation (Line(
          points={{-120,8},{-78,8},{-78,23.4},{-31,23.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AmbientTemperature, HeatExchanger.T_amb) annotation (Line(
          points={{-120,80},{-78,80},{-78,35.8},{-31,35.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(InletTemperature, nonCondensingTanklessHXController.T_Inlet)
        annotation (Line(
          points={{-120,8},{-78,8},{-78,-98.4},{-1.45455,-98.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwrSig, nonCondensingTanklessHXController.PowerSignal) annotation (
          Line(
          points={{-120,-140},{-80,-140},{-80,-105.6},{-1.45455,-105.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HeatExchanger.T_Out, T_Out) annotation (Line(
          points={{28.5,11},{66.25,11},{66.25,12},{110,12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(nonCondensingTanklessHXController.QElec, QEle) annotation (Line(
          points={{20.8,-108.96},{63.4,-108.96},{63.4,-108},{110,-108}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(HeatExchanger.QDotFlu, QDotFlu) annotation (Line(
          points={{26.5,23.4},{70,23.4},{70,42},{110,42}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -150},{100,100}}),      graphics), Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-150},{100,100}}),
            graphics={Bitmap(
              extent={{-98,94},{92,-142}},
              imageSource=
                  "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"
                   +
                  "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",
              fileName=
                  "modelica://TanklessWaterHeater/../../../../../../Users/Peter Grant/Pictures/NonCondensingTanklessSchematic.jpg")}));
    end HybridTankless;

    package Examples "Examples of how the heater models are used"
      model TanklessExample
        "An example of how the HybridTankless model is used"
        extends Modelica.Icons.Example;
        HybridTankless hybridTankless(
          Capacitance_input=18138.9,
          SteadyStateEff_input=0.83,
          UA_input=13.6521,
          T_Set_input=60,
          mdot_min_input=0.043,
          SpecificHeat_input=4190,
          nNode_input=10,
          EffPilot_input=0.8,
          Qdot_Pilot_input=0,
          Qdot_Rated_input=29307,
          EnergyDensityGas_input=13500,
          Qdot_min_input=5275,
          t_short=1.5,
          t_long=3,
          t_switch=30,
          QAct=50,
          QIdl=15)
          annotation (Placement(transformation(extent={{2,-14},{32,24}})));
        Modelica.Blocks.Sources.RealExpression realExpression(y=time)
          annotation (Placement(transformation(extent={{-96,-6},{-76,14}})));
        Modelica.Blocks.Tables.CombiTable1Ds TAmb(
          tableOnFile=true,
          tableName="Ambient",
          fileName="TanklessExampleAmbientTemperature.txt")
          annotation (Placement(transformation(extent={{-60,34},{-40,54}})));
        Modelica.Blocks.Tables.CombiTable1Ds TIn(
          tableOnFile=true,
          tableName="Inlet",
          fileName="TanklessExampleInletTemperature.txt")
          annotation (Placement(transformation(extent={{-60,8},{-40,28}})));
        Modelica.Blocks.Tables.CombiTable1Ds drawPat(
          tableOnFile=true,
          tableName="Flow",
          fileName="TanklessExampleDemandFlowPattern.txt")
          annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
        Modelica.Blocks.Tables.CombiTable1Ds pwrSig(
          tableOnFile=true,
          tableName="Power",
          fileName="TanklessExamplePowerSignal.txt")
          annotation (Placement(transformation(extent={{-60,-48},{-40,-28}})));
      equation
        connect(realExpression.y, TIn.u) annotation (Line(
            points={{-75,4},{-70,4},{-70,18},{-62,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(realExpression.y, TAmb.u) annotation (Line(
            points={{-75,4},{-70,4},{-70,44},{-62,44}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(realExpression.y, drawPat.u) annotation (Line(
            points={{-75,4},{-70,4},{-70,-10},{-62,-10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(realExpression.y, pwrSig.u) annotation (Line(
            points={{-75,4},{-70,4},{-70,-38},{-62,-38}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pwrSig.y[1], hybridTankless.pwrSig) annotation (Line(
            points={{-39,-38},{-20,-38},{-20,-12.48},{-1,-12.48}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(drawPat.y[1], hybridTankless.DemandFlowRate) annotation (Line(
            points={{-39,-10},{-20,-10},{-20,-0.32},{-1,-0.32}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(TIn.y[1], hybridTankless.InletTemperature) annotation (Line(
            points={{-39,18},{-20,18},{-20,10.016},{-1,10.016}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(TAmb.y[1], hybridTankless.AmbientTemperature) annotation (Line(
            points={{-39,44},{-20,44},{-20,20.96},{-1,20.96}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TanklessExample;

      model StorageTankExample
        "Provides an example of how the simplified storage tank model is used"
        extends Modelica.Icons.Example;
        SimplifiedStorageTank tan(
          redeclare package Medium = Modelica.Media.Water.WaterIF97_ph,
          nSeg=8,
          TStatHeight=7,
          TSet=273.105 + 52,
          RecircOutSeg=8,
          RecircInSeg=1,
          Deadband=12,
          UA=30,
          EffTan=0.25)
          annotation (Placement(transformation(extent={{24,-28},{102,32}})));
        Modelica.Blocks.Sources.Constant QInFlu(k=29307*0.2)
          annotation (Placement(transformation(extent={{-88,34},{-68,54}})));
        Modelica.Blocks.Sources.Constant Tamb(k=273.105 + 20)
          annotation (Placement(transformation(extent={{-88,2},{-68,22}})));
        Modelica.Blocks.Sources.Constant mFloCir(k=0.12)
          "Flow rate of the recirculation loop"
          annotation (Placement(transformation(extent={{-88,-28},{-68,-8}})));
        Modelica.Blocks.Math.Product product
          annotation (Placement(transformation(extent={{-56,-34},{-36,-14}})));
        Modelica.Blocks.Math.IntegerToReal integerToReal annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={50,-50})));
        Modelica.Blocks.Sources.Constant const(k=273.105 + 60)
          annotation (Placement(transformation(extent={{-20,-42},{0,-22}})));
        Modelica.Blocks.Sources.Constant TIn(k=273.105 + 20)
                                                   annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={70,70})));
        Modelica.Blocks.Sources.Sine sine[8](
          amplitude=0.5,
          offset=0.5,
          freqHz=0.0001)
          annotation (Placement(transformation(extent={{-94,72},{-74,92}})));
        Modelica.Blocks.Math.RealToInteger realToInteger[8]
          annotation (Placement(transformation(extent={{-64,72},{-44,92}})));
        Modelica.Blocks.Math.IntegerToReal integerToReal1[8]
          annotation (Placement(transformation(extent={{-36,72},{-16,92}})));
        Modelica.Blocks.Math.Gain gain[8](k=0.25)
          annotation (Placement(transformation(extent={{-4,72},{16,92}})));
        Modelica.Blocks.Math.Product product1
          annotation (Placement(transformation(extent={{-44,26},{-24,46}})));
      equation
        connect(Tamb.y, tan.TAmb) annotation (Line(
            points={{-67,12},{-62,12},{-62,14.3659},{20.983,14.3659}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(mFloCir.y, product.u1) annotation (Line(
            points={{-67,-18},{-58,-18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(tan.TStatSig, integerToReal.u) annotation (Line(
            points={{103.913,-16.5854},{112,-16.5854},{112,-50},{62,-50}},
            color={255,127,0},
            smooth=Smooth.None));
        connect(integerToReal.y, product.u2) annotation (Line(
            points={{39,-50},{-70,-50},{-70,-30},{-58,-30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product.y, tan.mFloRec) annotation (Line(
            points={{-35,-24},{-24,-24},{-24,-6.04878},{22.3811,-6.04878}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(const.y, tan.TInRec) annotation (Line(
            points={{1,-32},{8,-32},{8,-15.7073},{22.234,-15.7073}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(TIn.y, tan.TIn) annotation (Line(
            points={{70,59},{70,33.6098},{69.6226,33.6098}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sine.y, realToInteger.u) annotation (Line(
            points={{-73,82},{-66,82}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(realToInteger.y, integerToReal1.u) annotation (Line(
            points={{-43,82},{-38,82}},
            color={255,127,0},
            smooth=Smooth.None));
        connect(integerToReal1.y, gain.u) annotation (Line(
            points={{-15,82},{-6,82}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(gain.y, tan.m_flow_in) annotation (Line(
            points={{17,82},{44.4566,82},{44.4566,32.2927}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(QInFlu.y, product1.u2) annotation (Line(
            points={{-67,44},{-56,44},{-56,30},{-46,30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product1.y, tan.QFluIn) annotation (Line(
            points={{-23,36},{10,36},{10,24.6829},{21.3509,24.6829}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integerToReal.y, product1.u1) annotation (Line(
            points={{39,-50},{-94,-50},{-94,60},{-52,60},{-52,42},{-46,42}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end StorageTankExample;
    end Examples;

    package EditedBaseClasses
      "Provides versions of the subclasses used in the hybrid model"
      model NonModulating
        "Control Module for the tankless portion of a hybrid water heater"

      //Debugging notes: Need to work with PID Controller. Does not seem to work...at all

        Modelica.Blocks.Interfaces.RealInput T_out
         annotation (Placement(transformation(extent={{-140,-48},{-100,-8}})));
        Modelica.Blocks.Math.Add add(k1=-1, k2=+1)
          annotation (Placement(transformation(extent={{-66,6},{-46,26}})));
        Modelica.Blocks.Math.Product product
          annotation (Placement(transformation(extent={{-68,44},{-48,64}})));
        Modelica.Blocks.Math.Product product1
          annotation (Placement(transformation(extent={{-42,14},{-22,34}})));
        Modelica.Blocks.Interfaces.RealOutput mdot_water_controlled
          annotation (Placement(transformation(extent={{172,44},{202,74}})));
        Modelica.Blocks.Interfaces.RealOutput ControlConstant annotation (Placement(
              transformation(extent={{176,-52},{204,-24}}), iconTransformation(extent={{100,-72},
                  {128,-44}})));
        Modelica.Blocks.Math.Product product2
          annotation (Placement(transformation(extent={{48,50},{68,70}})));
        Modelica.Blocks.Math.BooleanToReal booleanToReal
          annotation (Placement(transformation(extent={{-22,70},{-2,90}})));
        Modelica.Blocks.Math.BooleanToReal booleanToReal1
          annotation (Placement(transformation(extent={{22,38},{42,58}})));
        Modelica.Blocks.Math.Product product3
          annotation (Placement(transformation(extent={{74,-42},{94,-22}})));
        TanklessWaterHeater.Controllers.HighFlowControl FlowRateControl(
          SteadyStateEff=SteadyStateEff_cons,
          Qdot_Rated=Qdot_Rated_cons,
          SpecificHeat=SpecificHeat_cons,
          T_Set=T_Set_cons)
          annotation (Placement(transformation(extent={{20,-8},{40,12}})));
        Modelica.Blocks.Logical.GreaterEqual greaterEqual
          annotation (Placement(transformation(extent={{-56,76},{-36,96}})));
        Modelica.Blocks.Interfaces.RealInput mdot_water
          annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
        Modelica.Blocks.Sources.RealExpression mdot_min(y=mdot_min_cons)
          annotation (Placement(transformation(extent={{-94,66},{-74,86}})));

       parameter Real mdot_min_cons(unit = "kg/s") = 0.252
          "Minimum flow rate of the tankless heater";
       parameter Real Qdot_min_cons(unit = "W") = 5275
          "Minimum heat rate of the tankless heater";
       parameter Real T_Set_cons(unit = "C") = 55 "Set Temperature";
       parameter Real SpecificHeat_cons(unit = "J/(kg.C)") = 4190
          "Specific heat of the fluid being heated";
       parameter Real Qdot_Rated_cons(unit = "W") = 55555
          "Raed heat input rate of the tankless heater";
       parameter Real SteadyStateEff_cons = 0.82;
       parameter Modelica.SIunits.Time t_short = 1.5
          "Start delay with a short time between draws";
       parameter Modelica.SIunits.Time t_long = 3
          "Start delay with a long time between draws";
       parameter Modelica.SIunits.Time t_switch = 30
          "Time between draws required for t_long";
       parameter Real QAct = 50
          "Electric power consumed when the fan is operating";
       parameter Real QIdl = 15
          "Electric power consumed when the fan is not operating";
       parameter Real QMinDea(unit = "W") = 5000
          "Deadband for the minimum heat rate";

        Modelica.Blocks.Sources.RealExpression SpecificHeat(y=SpecificHeat_cons)
          annotation (Placement(transformation(extent={{-98,20},{-78,40}})));
        Modelica.Blocks.Sources.RealExpression T_Set(y=T_Set_cons)
          annotation (Placement(transformation(extent={{-98,-24},{-78,-4}})));
        Modelica.Blocks.Sources.RealExpression Qdot_min(y=Qdot_min_cons)
          annotation (Placement(transformation(extent={{-40,46},{-20,66}})));
        Modelica.Blocks.Sources.RealExpression ControlSignal(y=1)
          "Has no PID control, only binary on/off control"
          annotation (Placement(transformation(extent={{24,-48},{44,-28}})));
        Modelica.Blocks.Interfaces.RealInput T_Inlet
          annotation (Placement(transformation(extent={{-140,0},{-100,40}})));
        Modelica.Blocks.Interfaces.RealInput PowerSignal
          annotation (Placement(transformation(extent={{-140,-90},{-100,-50}})));
        Modelica.Blocks.Math.Product product4
          annotation (Placement(transformation(extent={{110,-48},{130,-28}})));
        TanklessWaterHeater.Controllers.StartDelay startDelay(
          t_short=t_short,
          t_long=t_long,
          t_switch=t_switch)
          annotation (Placement(transformation(extent={{76,-96},{96,-76}})));
        Modelica.Blocks.Math.Product product5
          annotation (Placement(transformation(extent={{140,-84},{160,-64}})));
        Modelica.Blocks.Math.Product product6
          annotation (Placement(transformation(extent={{106,-116},{126,-96}})));
        Modelica.Blocks.Sources.Constant QFan(k=QAct)
          annotation (Placement(transformation(extent={{34,-112},{54,-92}})));
        Modelica.Blocks.Sources.Constant QCon(k=QIdl)
          annotation (Placement(transformation(extent={{34,-144},{54,-124}})));
        Modelica.Blocks.Interfaces.RealOutput QElec
          annotation (Placement(transformation(extent={{176,-122},{196,-102}})));
        Modelica.Blocks.Math.Max max1
          annotation (Placement(transformation(extent={{138,-122},{158,-102}})));
        Modelica.Blocks.Logical.OnOffController onOffController(bandwidth=QMinDea)
          annotation (Placement(transformation(extent={{-10,28},{10,48}})));
      equation
        connect(T_Set.y, add.u2) annotation (Line(
            points={{-77,-14},{-68,-14},{-68,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product.y, product1.u1) annotation (Line(
            points={{-47,54},{-46,54},{-46,30},{-44,30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add.y, product1.u2) annotation (Line(
            points={{-45,16},{-44,16},{-44,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(booleanToReal1.y, product2.u2) annotation (Line(
            points={{43,48},{46,48},{46,54}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(booleanToReal.y, product2.u1) annotation (Line(
            points={{-1,80},{22,80},{22,66},{46,66}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product3.u1, product2.y) annotation (Line(
            points={{72,-26},{72,60},{69,60}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(FlowRateControl.mdot_water_controlled, mdot_water_controlled)
          annotation (Line(
            points={{41.9,8.1},{126.95,8.1},{126.95,59},{187,59}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(greaterEqual.y, booleanToReal.u) annotation (Line(
            points={{-35,86},{-30,86},{-30,80},{-24,80}},
            color={255,0,255},
            smooth=Smooth.None));
        connect(mdot_water, product.u1) annotation (Line(
            points={{-120,60},{-70,60}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(mdot_water, greaterEqual.u1) annotation (Line(
            points={{-120,60},{-100,60},{-100,86},{-58,86}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(mdot_water,FlowRateControl. mdot_water) annotation (Line(
            points={{-120,60},{-99,60},{-99,0},{18,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(mdot_min.y, greaterEqual.u2) annotation (Line(
            points={{-73,76},{-66,76},{-66,78},{-58,78}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(SpecificHeat.y, product.u2) annotation (Line(
            points={{-77,30},{-74,30},{-74,48},{-70,48}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T_Inlet, add.u1) annotation (Line(
            points={{-120,20},{-94,20},{-94,22},{-68,22}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T_Inlet, FlowRateControl.T_Inlet) annotation (Line(
            points={{-120,20},{-94,20},{-94,4},{18,4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PowerSignal, FlowRateControl.PowerSignal) annotation (Line(
            points={{-120,-70},{-40,-70},{-40,-4},{18,-4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PowerSignal, product4.u2) annotation (Line(
            points={{-120,-70},{94,-70},{94,-44},{108,-44}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product3.y, product4.u1) annotation (Line(
            points={{95,-32},{108,-32}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(mdot_water, startDelay.mDotDra) annotation (Line(
            points={{-120,60},{-98,60},{-98,-86},{74,-86}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(startDelay.y, product5.u2) annotation (Line(
            points={{97,-86},{120,-86},{120,-80},{138,-80}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product4.y, product5.u1) annotation (Line(
            points={{131,-38},{132,-38},{132,-68},{138,-68}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product5.y, ControlConstant) annotation (Line(
            points={{161,-74},{164,-74},{164,-38},{190,-38}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(startDelay.y, product6.u1) annotation (Line(
            points={{97,-86},{100,-86},{100,-100},{104,-100}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(QFan.y, product6.u2) annotation (Line(
            points={{55,-102},{80,-102},{80,-112},{104,-112}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product6.y, max1.u1) annotation (Line(
            points={{127,-106},{136,-106}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(QCon.y, max1.u2) annotation (Line(
            points={{55,-134},{124,-134},{124,-118},{136,-118}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(QElec, QElec) annotation (Line(
            points={{186,-112},{186,-112}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(max1.y, QElec) annotation (Line(
            points={{159,-112},{186,-112}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(ControlSignal.y, product3.u2) annotation (Line(
            points={{45,-38},{72,-38}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(onOffController.y, booleanToReal1.u) annotation (Line(
            points={{11,38},{20,38},{20,48}},
            color={255,0,255},
            smooth=Smooth.None));
        connect(product1.y, FlowRateControl.Qdot_Required) annotation (Line(
            points={{-21,24},{-10,24},{-10,8},{18,8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Qdot_min.y, onOffController.u) annotation (Line(
            points={{-19,56},{-20,56},{-20,32},{-12,32}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product1.y, onOffController.reference) annotation (Line(
            points={{-21,24},{-16,24},{-16,44},{-12,44}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-150},
                  {175,100}}),
                  graphics),
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-150},{175,100}}),
               graphics={Bitmap(extent={{-100,96},{100,-98}}, fileName=
                    "//vmware-host/Shared Folders/Downloads/ControlModule.jpg")}));
      end NonModulating;

      model HybridTanklessHX
        "A model representing a standard heat exchanger in a tankless water heaterVersion 1.0 - Date: 4/27/2012 - Created by PGrant based on his thesis"

        parameter Real Capacitance(unit = "J/C") = 8360
          "Thermal capacitance of the heat exchanger";
        parameter Real SteadyStateEff = 0.82
          "Heater efficiency at steady state";
        parameter Real UA(unit = "W/C") = 3.6
          "Coefficient describing heat loss to ambient conditions";
        parameter Real ConductionCoefficient(unit = "W/C") = 0.1
          "Coefficient characterizing the conduction of heat in the heat exchanger";
        parameter Integer nNode = 10
          "Number of nodes the heat exchanger is broken into";
        parameter Real EffPilot = 0.8 "Efficiency of the pilot light";
        parameter Real Qdot_Pilot(unit = "W") = 0
          "Input heat rate of the pilot light";
        parameter Real Qdot_Rated(unit = "W") = 55555
          "Rated capacity of the main burner";
      //  parameter Real T_amb(unit = "C") = 20
      //    "Ambient temperature around the water heater";
        parameter Real SpecificHeat(unit = "J/(kg.C)") = 4190
          "Specific heat of the fluid being heated";
        parameter Real T_Set(unit = "C") = 55
          "Set temperature of the tankless heater";
      //  parameter Real T_Inlet(unit = "C") = 20 "Entering water temperature";
        parameter Real EnergyDensityGas(unit = "W/kg") = 13500;
        Real T_Node[nNode](unit = "C", each start = 273.105 + 20);
        Real a[nNode];
        Real b[nNode];
        Real Qdot_Delivered(unit = "W");
        Real Qdot_Env[nNode](unit = "W");
        Real Qdot_Environment(unit = "W");
        Real Q_Stored(unit = "J");
        Real AvgTemp(unit = "C");
        Real Qdot_in(unit = "W");
        Real mdot_g(unit = "kg/hr");
        Real Qdot_Stored( unit = "W");

        Modelica.Blocks.Interfaces.RealInput mdot_water(unit = "kg/s")
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
        Modelica.Blocks.Interfaces.RealInput ControlConstant
                                                            annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={8,-120})));
        Modelica.Blocks.Interfaces.RealOutput T_Out
          annotation (Placement(transformation(extent={{100,-18},{136,18}})));
        Modelica.Blocks.Interfaces.RealInput T_amb
          annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
        Modelica.Blocks.Interfaces.RealInput T_Inlet
          annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
        Modelica.Blocks.Interfaces.RealOutput QDotFlu
          annotation (Placement(transformation(extent={{100,30},{120,50}})));
      equation

      if (nNode > 1) then

        a[1] = (-1/Capacitance) * (mdot_water * SpecificHeat * nNode + 2 * ConductionCoefficient * nNode + UA);
        b[1] = (1/Capacitance) * (SteadyStateEff * ControlConstant * Qdot_Rated + EffPilot * Qdot_Pilot + mdot_water * SpecificHeat * T_Inlet * nNode + ConductionCoefficient * (T_Node[2] + T_Inlet) * nNode + UA * T_amb);

        a[nNode] = (-1/Capacitance) * (mdot_water * SpecificHeat * nNode + ConductionCoefficient * nNode + UA);
        b[nNode] = (1/Capacitance) * (SteadyStateEff * ControlConstant * Qdot_Rated + EffPilot * Qdot_Pilot + mdot_water * SpecificHeat * T_Node[nNode-1] * nNode + ConductionCoefficient * T_Node[nNode-1] * nNode + UA * T_amb);

        for i in 2:nNode - 1 loop
          a[i] = (-1/Capacitance) * (mdot_water * SpecificHeat * nNode + 2 * ConductionCoefficient * nNode + UA);
          b[i] = (1/Capacitance) * (SteadyStateEff * ControlConstant * Qdot_Rated + EffPilot * Qdot_Pilot + mdot_water * SpecificHeat * T_Node[i-1] * nNode + ConductionCoefficient * (T_Node[i+1] + T_Node[i-1]) * nNode + UA * T_amb);
        end for;

      else

        a[1] = (-1/Capacitance) * (mdot_water * SpecificHeat * nNode + 2 * ConductionCoefficient * nNode + UA);
        b[1] = (1/Capacitance) * (SteadyStateEff * ControlConstant * Qdot_Rated + EffPilot * Qdot_Pilot + mdot_water * SpecificHeat * T_Inlet * nNode + ConductionCoefficient * (T_Out + T_Inlet) * nNode + UA * T_amb);

      end if;

      for i in 1:nNode loop
        der(T_Node[i]) = a[i] * T_Node[i] + b[i];
        Qdot_Env[i] = UA/nNode * (T_Node[i] - T_amb);
      end for;

      Qdot_Environment = sum(Qdot_Env[1:nNode]); //Sums up the environmental losses from all nodes into one cumulative Qdot_Env
      Qdot_in = Qdot_Pilot + Qdot_Rated * ControlConstant;
      T_Out = T_Node[nNode];
      Qdot_Delivered = mdot_water * SpecificHeat * (T_Out - T_Inlet);
      Q_Stored = Capacitance * sum(T_Node[1:nNode])/nNode;
      Qdot_Stored = der(Q_Stored);
      QDotFlu = Qdot_in -Qdot_Environment - Qdot_Delivered - Qdot_Stored;
      AvgTemp = sum(T_Node[1:nNode])/nNode;
      if ControlConstant > 0 then
        mdot_g = ControlConstant * Qdot_Rated / EnergyDensityGas;
      else
        mdot_g = 0.001;
      end if;

        annotation (Diagram(graphics), Icon(graphics={Bitmap(extent={{-100,98},{100,-100}},
                  fileName="//vmware-host/Shared Folders/Downloads/HeatExchanger.jpg")}),
                    Diagram(graphics));
      end HybridTanklessHX;

      model HyDra
        "Calculates the heat transfer rates caused by a hot water draw event (Hybrid Model)"
        extends Modelica.Blocks.Interfaces.BlockIcon;
         replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;

         Medium.SpecificHeatCapacity c_p=Medium.specificHeatCapacityCp(
           Medium.setState_pTX(
             Medium.p_default,
             Medium.T_default,
             Medium.X_default));

        parameter Integer nSeg(min=2) = 8;

        Modelica.Blocks.Interfaces.RealInput mFloIn[nSeg]
          annotation (Placement(transformation(extent={{-140,-70},{-100,-30}})));
        Modelica.Blocks.Interfaces.RealOutput draHeaTra[nSeg]
          annotation (Placement(transformation(extent={{100,-2},{120,18}})));
        Modelica.Blocks.Interfaces.RealInput TWat[nSeg]
          annotation (Placement(transformation(extent={{-140,52},{-100,92}})));
        Modelica.Blocks.Interfaces.RealInput TIn
          annotation (Placement(transformation(extent={{-140,12},{-100,52}})));
      equation

      for i in 1:nSeg loop
        draHeaTra[i] = mFloIn[i]/nSeg * c_p * (TWat[i] - TIn);
      end for;

        annotation (Diagram(graphics));
      end HyDra;

      model Pump
        extends Modelica.Blocks.Interfaces.BlockIcon;

        parameter Real RecircFlow "Recirculation flow rate";
        parameter Real QElePum = 50
          "Electricity consumption when the pump is active";

        Modelica.Blocks.Interfaces.IntegerInput
                                             TStatSig
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
        Modelica.Blocks.Interfaces.RealOutput CircFlow
          annotation (Placement(transformation(extent={{100,-10},{120,10}})));
        Modelica.Blocks.Math.Product product
          annotation (Placement(transformation(extent={{-22,-16},{-2,4}})));
        Modelica.Blocks.Sources.RealExpression realExpression(y=RecircFlow)
          annotation (Placement(transformation(extent={{-82,-22},{-62,-2}})));
        Modelica.Blocks.Sources.RealExpression realExpression1(y=QElePum)
          annotation (Placement(transformation(extent={{-82,36},{-62,56}})));
        Modelica.Blocks.Math.Product product1
          annotation (Placement(transformation(extent={{-22,30},{-2,50}})));
        Modelica.Blocks.Interfaces.RealOutput QPum
          annotation (Placement(transformation(extent={{100,30},{120,50}})));
      equation
        connect(TStatSig, product.u1) annotation (Line(
            points={{-120,0},{-24,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product.y, CircFlow) annotation (Line(
            points={{-1,-6},{40,-6},{40,0},{110,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(realExpression.y, product.u2) annotation (Line(
            points={{-61,-12},{-24,-12}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product1.y, QPum) annotation (Line(
            points={{-1,40},{110,40}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(realExpression1.y, product1.u1) annotation (Line(
            points={{-61,46},{-24,46}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(TStatSig, product1.u2) annotation (Line(
            points={{-120,0},{-60,0},{-60,34},{-24,34}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end Pump;

      model cirHeaTra "Heat transfer caused by the recirculation loop"
        extends Modelica.Blocks.Interfaces.BlockIcon;

        replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;

        Medium.SpecificHeatCapacity c_p=Medium.specificHeatCapacityCp(
            Medium.setState_pTX(
              Medium.p_default,
              Medium.T_default,
              Medium.X_default));

        parameter Integer nSeg(min=2) = 8;

        Modelica.Blocks.Interfaces.RealInput mFloCir "Recirculation flow rate"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
        Modelica.Blocks.Interfaces.RealInput TWat[nSeg]
          "Water temperature in all segments"
          annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
        Modelica.Blocks.Interfaces.RealInput TRec
          "Recirculation inlet temperature"
          annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
        Modelica.Blocks.Interfaces.RealOutput cirHeaTra[nSeg]
          annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      equation

        for i in 1:nSeg loop
          cirHeaTra[i] = mFloCir/nSeg * c_p * (TRec - TWat[i]);
        end for;

      end cirHeaTra;

      model fluHeaTra "Models the heat transfer through the flue"
        extends Modelica.Blocks.Interfaces.BlockIcon;
        parameter Integer nSeg(min=2) = 8;
        parameter Real EffTan;
        Modelica.Blocks.Interfaces.RealInput QDotFlu "Heat entering the flue"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
        Modelica.Blocks.Interfaces.RealOutput fluHeaTra[nSeg]
          "Heat entering each segment through the flue"
          annotation (Placement(transformation(extent={{100,-10},{120,10}})));

      equation
        for i in 1:nSeg loop
          fluHeaTra[i] = QDotFlu * EffTan/nSeg;
        end for;

      end fluHeaTra;

      model UALoss "Identifies the UA losses in the tank"
        extends Modelica.Blocks.Interfaces.BlockIcon;

        parameter Integer nSeg(min=2) = 8;
        parameter Real UA;

        Modelica.Blocks.Interfaces.RealInput TWat[nSeg]
          annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
        Modelica.Blocks.Interfaces.RealInput TAmb
          annotation (Placement(transformation(extent={{-140,-40},{-100,2}})));
        Modelica.Blocks.Interfaces.RealOutput UALoss[nSeg]
          annotation (Placement(transformation(extent={{100,-10},{120,10}})));

      equation
        for i in 1:nSeg loop
          UALoss[i] = UA/nSeg * (TWat[i] - TAmb);
        end for;

      end UALoss;

      model EffTank
        "Uses the provided system and tankless effiicency to find the heat transfer efficiency of the tank"
        extends Modelica.Blocks.Interfaces.BlockIcon;

        parameter Real EffTankless = 0.8;
        parameter Real EffSys = 0.85;

        Modelica.Blocks.Interfaces.RealOutput EffTank
          annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      equation

        EffTank = (EffSys - EffTankless) / (1 - EffTankless);

      end EffTank;

      package BaseClassExamples
        "Provides examples of how base classes are used"
        model PumpExample
          "An example of how the hybrid library pump model is used"
          extends Modelica.Icons.Example;
          Pump pump(RecircFlow=0.12, QElePum=50)
            annotation (Placement(transformation(extent={{0,-12},{20,8}})));
          Modelica.Blocks.Math.RealToInteger realToInteger
            annotation (Placement(transformation(extent={{-42,-12},{-22,8}})));
          Modelica.Blocks.Sources.Sine sine(
            amplitude=0.5,
            freqHz=0.2,
            offset=0.5)
            annotation (Placement(transformation(extent={{-84,-12},{-64,8}})));
        equation
          connect(realToInteger.y, pump.TStatSig) annotation (Line(
              points={{-21,-2},{-2,-2}},
              color={255,127,0},
              smooth=Smooth.None));
          connect(sine.y, realToInteger.u) annotation (Line(
              points={{-63,-2},{-44,-2}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end PumpExample;

        model EffTank
          "Provides an example showing how the EffTank model is used"
          import Hybrid;
          extends Modelica.Icons.Example;
          Hybrid.HeatersUsed.EditedBaseClasses.EffTank effTank(EffTankless=0.85,
              EffSys=0.9)
            annotation (Placement(transformation(extent={{-14,-8},{6,12}})));
        end EffTank;

        model UALossExample
          "Provides an example of how the UALoss model is used"
          extends Modelica.Icons.Example;
          UALoss uALoss(                  nSeg=8, UA=30)
            annotation (Placement(transformation(extent={{-12,2},{8,22}})));
          Modelica.Blocks.Sources.Constant TAmb(k=20)
            annotation (Placement(transformation(extent={{-84,-10},{-64,10}})));
          Modelica.Blocks.Sources.Constant TWat[8](k=52)
            annotation (Placement(transformation(extent={{-84,26},{-64,46}})));
        equation
          connect(TAmb.y, uALoss.TAmb) annotation (Line(
              points={{-63,0},{-38,0},{-38,10.1},{-14,10.1}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(TWat.y, uALoss.TWat) annotation (Line(
              points={{-63,36},{-38,36},{-38,16},{-14,16}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end UALossExample;

        model fluHeaTraExample "Provides an example of the use of fluHeaTra"
          extends Modelica.Icons.Example;
          fluHeaTra fluHeaTra1(nSeg=8, EffTan=0.25)
            annotation (Placement(transformation(extent={{-24,-14},{-4,6}})));
          Modelica.Blocks.Sources.Sine sine(
            amplitude=5000,
            freqHz=0.01,
            offset=10000)
            annotation (Placement(transformation(extent={{-72,-14},{-52,6}})));
        equation
          connect(sine.y, fluHeaTra1.QDotFlu) annotation (Line(
              points={{-51,-4},{-26,-4}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end fluHeaTraExample;

        model HyDraExample "Example showing use of the HyDra model"
          extends Modelica.Icons.Example;

          package Water = Modelica.Media.Water.WaterIF97_ph "Medium model";

          HyDra hyDra(redeclare package Medium = Water, nSeg=8)
                      annotation (Placement(transformation(extent={{18,-16},{38,
                    4}})));
          Modelica.Blocks.Sources.Constant const[8](k=52)
            annotation (Placement(transformation(extent={{-84,12},{-64,32}})));
          Modelica.Blocks.Sources.Constant const1(k=20)
            annotation (Placement(transformation(extent={{-84,-18},{-64,2}})));
          Modelica.Blocks.Sources.Sine sine[8](
            freqHz=0.1,
            amplitude=0.5,
            offset=0.5) annotation (Placement(transformation(extent={{-90,-50},
                    {-70,-30}})));
          Modelica.Blocks.Math.RealToInteger realToInteger[8] annotation (
              Placement(transformation(extent={{-60,-50},{-40,-30}})));
          Modelica.Blocks.Math.IntegerToReal integerToReal[8] annotation (
              Placement(transformation(extent={{-32,-50},{-12,-30}})));
        equation
          connect(const.y, hyDra.TWat) annotation (Line(
              points={{-63,22},{-40,22},{-40,1.2},{16,1.2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(const1.y, hyDra.TIn) annotation (Line(
              points={{-63,-8},{-40,-8},{-40,-2.8},{16,-2.8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(sine.y, realToInteger.u) annotation (Line(
              points={{-69,-40},{-62,-40}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(realToInteger.y, integerToReal.u) annotation (Line(
              points={{-39,-40},{-34,-40}},
              color={255,127,0},
              smooth=Smooth.None));
          connect(integerToReal.y, hyDra.mFloIn) annotation (Line(
              points={{-11,-40},{0,-40},{0,-11},{16,-11}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end HyDraExample;

        model cirHeaTraExample "Example of how the cirHeaTra model is used"
          extends Modelica.Icons.Example;
          cirHeaTra cirHeaTra1(nSeg=8, c_p=4184.78)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
          Modelica.Blocks.Sources.Sine sine(
            freqHz=0.001,
            amplitude=30,
            offset=30) annotation (Placement(transformation(extent={{-60,-40},{
                    -40,-20}})));
          Modelica.Blocks.Sources.Constant const(k=0.12)
            annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
          Modelica.Blocks.Sources.Constant const1[8](k=52)
            annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
        equation
          connect(sine.y, cirHeaTra1.TRec) annotation (Line(
              points={{-39,-30},{-20,-30},{-20,-8},{-12,-8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(const.y, cirHeaTra1.mFloCir) annotation (Line(
              points={{-39,0},{-12,0}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(const1.y, cirHeaTra1.TWat) annotation (Line(
              points={{-39,30},{-20,30},{-20,8},{-12,8}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end cirHeaTraExample;

        model NonModulatingExample
          "Example of how the NonModulating tankless controller model is used"
          extends Modelica.Icons.Example;
          NonModulating nonModulating(
            Qdot_min_cons=5275,
            T_Set_cons=60,
            SpecificHeat_cons=4184.78,
            Qdot_Rated_cons=29307,
            SteadyStateEff_cons=0.82,
            t_short=1.5,
            t_long=3,
            t_switch=30,
            QAct=50,
            QIdl=15,
            mdot_min_cons=0.043)
            annotation (Placement(transformation(extent={{16,-24},{44,2}})));
          Modelica.Blocks.Sources.Sine sine(
            amplitude=0.06,
            freqHz=0.001,
            offset=0.03)
            annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
          Modelica.Blocks.Sources.Sine sine1(
            amplitude=90,
            offset=-30,
            freqHz=0.0001) annotation (Placement(transformation(extent={{-80,
                    -40},{-60,-20}})));
          Modelica.Blocks.Sources.Constant const(k=20)
            annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
          Modelica.Blocks.Sources.Sine sine2(
            amplitude=0.5,
            freqHz=0.01,
            offset=0.5) annotation (Placement(transformation(extent={{-80,-80},
                    {-60,-60}})));
          Modelica.Blocks.Math.RealToInteger realToInteger annotation (
              Placement(transformation(extent={{-52,-80},{-32,-60}})));
          Modelica.Blocks.Math.IntegerToReal integerToReal
            annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
        equation
          connect(sine2.y, realToInteger.u) annotation (Line(
              points={{-59,-70},{-54,-70}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(realToInteger.y, integerToReal.u) annotation (Line(
              points={{-31,-70},{-22,-70}},
              color={255,127,0},
              smooth=Smooth.None));
          connect(integerToReal.y, nonModulating.PowerSignal) annotation (Line(
              points={{1,-70},{6,-70},{6,-15.68},{13.9636,-15.68}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(sine1.y, nonModulating.T_out) annotation (Line(
              points={{-59,-30},{-20,-30},{-20,-11.312},{13.9636,-11.312}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(const.y, nonModulating.T_Inlet) annotation (Line(
              points={{-59,10},{-20,10},{-20,-6.32},{13.9636,-6.32}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(sine.y, nonModulating.mdot_water) annotation (Line(
              points={{-59,50},{6,50},{6,-2.16},{13.9636,-2.16}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end NonModulatingExample;

        model HybridTanklessHXExample
          "Example of how the HybridTanklessHX model is used"
          extends Modelica.Icons.Example;
          HybridTanklessHX hybridTanklessHX(
            Capacitance=13138.9,
            SteadyStateEff=0.82,
            UA=3.6,
            ConductionCoefficient=0.00001,
            nNode=4,
            EffPilot=0.8,
            Qdot_Pilot=0,
            Qdot_Rated=29307,
            SpecificHeat=4190,
            T_Set=60,
            EnergyDensityGas=13500)
            annotation (Placement(transformation(extent={{0,0},{20,20}})));
          Modelica.Blocks.Sources.Constant TAmb(k=20)
            annotation (Placement(transformation(extent={{-80,22},{-60,42}})));
          Modelica.Blocks.Sources.Constant TInlet(k=15)
            annotation (Placement(transformation(extent={{-80,-8},{-60,12}})));
          Modelica.Blocks.Sources.Sine mDotWat(
            amplitude=0.5,
            freqHz=0.001,
            offset=0.05) annotation (Placement(transformation(extent={{-100,-40},
                    {-80,-20}})));
          Modelica.Blocks.Math.RealToInteger realToInteger annotation (
              Placement(transformation(extent={{-72,-40},{-52,-20}})));
          Modelica.Blocks.Math.IntegerToReal integerToReal annotation (
              Placement(transformation(extent={{-44,-40},{-24,-20}})));
          Modelica.Blocks.Sources.Sine ContSig(
            amplitude=0.5,
            freqHz=0.01,
            offset=0.5) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={10,-80})));
        equation
          connect(TAmb.y, hybridTanklessHX.T_amb) annotation (Line(
              points={{-59,32},{-40,32},{-40,18},{-2,18}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(TInlet.y, hybridTanklessHX.T_Inlet) annotation (Line(
              points={{-59,2},{-40,2},{-40,14},{-2,14}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(mDotWat.y, realToInteger.u) annotation (Line(
              points={{-79,-30},{-74,-30}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(realToInteger.y, integerToReal.u) annotation (Line(
              points={{-51,-30},{-46,-30}},
              color={255,127,0},
              smooth=Smooth.None));
          connect(integerToReal.y, hybridTanklessHX.mdot_water) annotation (
              Line(
              points={{-23,-30},{-12,-30},{-12,10},{-2,10}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(ContSig.y, hybridTanklessHX.ControlConstant) annotation (Line(
              points={{10,-69},{10,-35.5},{10,-2},{10.8,-2}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end HybridTanklessHXExample;
      end BaseClassExamples;
    end EditedBaseClasses;
  end HeatersUsed;

  package Examples
    model GenHyb "A generic hybrid water heater"
      extends Modelica.Icons.Example;
      HybridWH hybridWH(
        RecircFlow=0.12,
        tswitch=30,
        TSetTankless=60 + 273.105,
        Deadband=6,
        QMinDea=1000,
        TSetTank=273.105 + 45)
        annotation (Placement(transformation(extent={{54,-14},{96,26}})));
      Modelica.Blocks.Sources.Constant const(k=1)
        annotation (Placement(transformation(extent={{-66,-64},{-46,-44}})));
      Modelica.Blocks.Sources.Constant const1(k=273.105 + 20)
        annotation (Placement(transformation(extent={{-66,-32},{-46,-12}})));
      Modelica.Blocks.Sources.Constant const2(k=273.105 + 15)
        annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
      Modelica.Blocks.Sources.Sine sine[8](
        amplitude=0.5,
        freqHz=0.0001,
        offset=0.5)
        annotation (Placement(transformation(extent={{-88,6},{-68,26}})));
      Modelica.Blocks.Math.RealToInteger realToInteger[8]
        annotation (Placement(transformation(extent={{-58,6},{-38,26}})));
      Modelica.Blocks.Math.IntegerToReal integerToReal[8]
        annotation (Placement(transformation(extent={{-28,6},{-8,26}})));
      Modelica.Blocks.Math.Gain gain[8](k=0.12)
        annotation (Placement(transformation(extent={{2,6},{22,26}})));
    equation
      connect(const.y, hybridWH.PowerSignal) annotation (Line(
          points={{-45,-54},{42,-54},{42,4.93333},{49.8,4.93333}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hybridWH.TAmb, const1.y) annotation (Line(
          points={{49.8,8.66667},{22,8.66667},{22,-22},{-45,-22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(const2.y, hybridWH.TIn) annotation (Line(
          points={{-39,50},{38,50},{38,16.6667},{49.8,16.6667}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sine.y, realToInteger.u) annotation (Line(
          points={{-67,16},{-60,16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realToInteger.y, integerToReal.u) annotation (Line(
          points={{-37,16},{-30,16}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(integerToReal.y, gain.u) annotation (Line(
          points={{-7,16},{0,16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gain.y, hybridWH.mFloIn) annotation (Line(
          points={{23,16},{36.4,16},{36.4,12.6667},{49.8,12.6667}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(graphics), Diagram(graphics));
    end GenHyb;
  end Examples;
  annotation (uses(
      TanklessWaterHeater(version="1"),
      WaterHeaterLib(version="1"),
      Modelica(version="3.2"),
      Buildings(version="1.2")));
end Hybrid;
