within ;
package CombinedExamples
  "Provides system-level models made of models from various water heating packages"
  model StorageTankWithTwoPipe
    "A storage tank water heater with a two pipe distribution system"

    extends Modelica.Icons.Example;

    package Water = Buildings.Media.ConstantPropertyLiquidWater;

    parameter Integer nStaRef=6 "Number of states in a reference material";
    parameter Real T_DB = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "DryBulbTemperature");
    parameter Real TMeaRad = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "MeanRadiantTemperature");
    parameter Real T_Floor = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "FloorTemperature");
    parameter Real Q_P = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "QDot_Pilot");
    parameter Real Q_Burner = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "QDot_Burner");
    parameter Real T_Set = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "T_Set");
    parameter Real Deadband = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "ThermostatDeadband");
    parameter Real TankVolume = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "TankVolume");
    parameter Real FlueDiameter = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "FlueDiameter");
    parameter Real FlueLength = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "FlueLength");
    parameter Real InletWaterTemp = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "InletWaterTemp");
    parameter Real FlueToWaterConvectionCoefficient = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "FlueToWaterConvectionCoefficient");
    parameter Real GasToFlueConvectionCoefficient = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "GasToFlueConvectionCoefficient");
    parameter Real TankDiameter = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "TankDiameter");
    parameter Real GasToBaseConvectionCoefficient = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "GasToBaseConvectionCoefficient");
    parameter Real FuelHigherHeatingValue = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "FuelHigherHeatingValue");
    parameter Real FuelLowerHeatingValue = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "FuelLowerHeatingValue");
    parameter Real StoichiometricAirFuelRatio = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "StoichiometricAirFuelRatio");
    parameter Real ExcessAir = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "ExcessAir");
    parameter Real GasSpecificHeat = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "GasSpecificHeat");
    parameter Integer nSeg = WaterHeaterLib.BaseClasses.readIntegerParameter("StorageExampleParameters.txt", "nSeg");

    inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
        massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) annotation (
        Placement(transformation(extent={{-200,-134},{-180,-114}})));
    Buildings.HeatTransfer.Sources.PrescribedTemperature TBCBot
      "Boundary condition for tank" annotation (Placement(transformation(
          extent={{6,-6},{-6,6}},
          rotation=180,
          origin={-116,-4})));
    Modelica.Blocks.Sources.Constant QBurner(k=11000) annotation (Placement(
          transformation(extent={{80,-74},{60,-94}},   rotation=0)));
    parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic
      matLayExt(
      absIR_a=0.9,
      absIR_b=0.9,
      absSol_a=0.6,
      absSol_b=0.6,
      nLay=2,
      material={Buildings.HeatTransfer.Data.Solids.Generic(
          x=0.012,
          k=4.671,
          c=473,
          d=7801,
          nStaRef=nStaRef),Buildings.HeatTransfer.Data.Solids.Generic(
          x=0.013,
          k=0.04,
          c=1380,
          d=150,
          nStaRef=nStaRef)}) "Tank Envelope"
      annotation (Placement(transformation(extent={{-202,-94},{-184,-76}})));
    parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic
      matLayTanBot(
      absIR_a=0.9,
      absIR_b=0.9,
      absSol_a=0.6,
      absSol_b=0.6,
      final nLay=1,
      material={Buildings.HeatTransfer.Data.Solids.Generic(
              x=0.003176,
              k=4.671,
              c=473,
              d=7801,
              nStaRef=nStaRef)}) "Flue Wall"
      annotation (Placement(transformation(extent={{-174,-94},{-156,-76}})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor T_sensor
      "switch temperature"
      annotation (Placement(transformation(extent={{2,-12},{12,-2}})));
    Modelica.Blocks.Logical.OnOffController onOffController(bandwidth=12)
      annotation (Placement(transformation(extent={{-4,-138},{-24,-118}})));
    Modelica.Blocks.Sources.Constant T_switch(k=273.105 + 48)
      annotation (Placement(transformation(extent={{82,-132},{62,-112}})));
    Modelica.Blocks.Math.BooleanToReal booleanToInteger
      annotation (Placement(transformation(extent={{-36,-138},{-56,-118}})));
    Modelica.Blocks.Math.Product product annotation (Placement(transformation(
          extent={{-8,-8},{8,8}},
          rotation=90,
          origin={-62,-70})));
    parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic
      matLayFlue(
      absIR_a=0.9,
      absIR_b=0.9,
      absSol_a=0.6,
      absSol_b=0.6,
      final nLay=1,
      material={Buildings.HeatTransfer.Data.Solids.Generic(
              x=0.000753,
              k=4.671,
              c=1,
              d=7801,
              nStaRef=nStaRef)}) "Flue Wall"
      annotation (Placement(transformation(extent={{-144,-94},{-126,-76}})));
    Modelica.Blocks.Sources.Constant TDryBul(k=T_DB)
      annotation (Placement(transformation(extent={{80,72},{60,92}})));
    Modelica.Blocks.Sources.Constant TRadMea(k=TMeaRad)
      annotation (Placement(transformation(extent={{80,34},{60,54}})));
    Modelica.Blocks.Sources.Constant TFloor(k=T_Floor)
      annotation (Placement(transformation(extent={{-194,-14},{-174,6}})));
    Modelica.Blocks.Sources.Constant QPilot(k=158) annotation (Placement(
          transformation(extent={{80,-38},{60,-58}},   rotation=0)));
    Modelica.Blocks.Math.Add add annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-54,-32})));
    WaterHeaterLib.BaseClasses.Burner.Gas
                           burn(
      datTanEnv(
        layers=matLayExt,
        A=1.75,
        til=Buildings.HeatTransfer.Types.Tilt.Wall,
        azi=Buildings.HeatTransfer.Types.Azimuth.W),
      datTanEnvBot(
        layers=matLayTanBot,
        A=0.12,
        til=Buildings.HeatTransfer.Types.Tilt.Floor,
        azi=Buildings.HeatTransfer.Types.Azimuth.W),
      absIR_FS=0.2,
      DTan=TankDiameter,
      DFlu=FlueDiameter,
      h_GB=GasToBaseConvectionCoefficient,
      deltaHc_H=FuelHigherHeatingValue,
      deltaHc_L=FuelLowerHeatingValue,
      stoich=StoichiometricAirFuelRatio,
      EA=ExcessAir,
      cp_G=GasSpecificHeat)
      annotation (Placement(transformation(extent={{-84,4},{-26,46}})));
    WaterHeaterLib.WaterHeater tan(
      allowFlowReversal=false,
      m_flow_nominal=0.001,
      energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
      massDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
      datTanEnv(
        layers=matLayExt,
        A=1.75,
        til=Buildings.HeatTransfer.Types.Tilt.Wall,
        azi=Buildings.HeatTransfer.Types.Azimuth.W),
      datTanEnvTop(
        layers=matLayExt,
        A=0.04,
        til=Buildings.HeatTransfer.Types.Tilt.Ceiling,
        azi=Buildings.HeatTransfer.Types.Azimuth.W),
      datTanEnvBot(
        layers=matLayTanBot,
        A=0.12,
        til=Buildings.HeatTransfer.Types.Tilt.Floor,
        azi=Buildings.HeatTransfer.Types.Azimuth.W),
      h_cw_B_cons=1000,
      datFlueWall(
        layers=matLayFlue,
        A=0.236,
        til=Buildings.HeatTransfer.Types.Tilt.Wall),
      c_wB=1/15,
      c_wI=0.001,
      c_sr=110000,
      conMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
      VTan=TankVolume,
      DFlu=FlueDiameter,
      LFlu=FlueLength,
      TIn=InletWaterTemp,
      h_WF_cons=FlueToWaterConvectionCoefficient,
      h_cv_F=GasToFlueConvectionCoefficient,
      nSeg=nSeg,
      perInA={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1.0033,2.8428,-0.4415,6.1873,4.0134},
      perInB={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1.1405,0.102,-0.2213,-2.8662,-2.0619},
      perInC={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-0.0224,-0.0032,0.2329,0.5048,0.7896},
      timDelA={-2092.3,-2092.3,-2092.3,-2092.3,-2092.3,-2092.3,-2092.3,-2092.3,-2092.3,
          -2092.3,-2092.3,-2092.3,-2092.3,-2376.6,-2660.9,-3112.4,-1971.9,-567.21,
          100.33,0},
      timDelB={812.61,812.61,812.61,812.61,812.61,812.61,812.61,812.61,812.61,812.61,
          812.61,812.61,812.61,802.41,792.21,805.42,475.76,79.1,-14.047,0},
      timDelC={7.6157,7.6157,7.6157,7.6157,7.6157,7.6157,7.6157,7.6157,7.6157,7.6157,
          7.6157,7.6157,7.6157,7.9334,8.2512,8.1676,14.305,21.676,0.2408,0},
      redeclare package Medium = Water,
      T_Initial={326.139441,326.139441,326.139442,326.139441,326.078106,326.078106,
          326.078106,326.080484,326.080484,326.080484,326.080484,326.038548,326.038548,
          326.038548,324.322451,325.322451,324.437641,322.833392,322.833392,321.872635})
      annotation (Placement(transformation(extent={{-112,52},{2,140}})));
    Modelica.Blocks.Sources.RealExpression realExpression4[nSeg](y=
          twoPipeDistributionSystem.sum1.y)
      annotation (Placement(transformation(extent={{-214,130},{-194,150}})));
    Modelica.Blocks.Sources.RealExpression realExpression(y=tan.vol[1].T)
      annotation (Placement(transformation(extent={{132,-12},{152,8}})));
    HWDis.BaseClasses.TwoPipeDistributionSystem twoPipeDistributionSystem(
        redeclare package Water = Water)
      annotation (Placement(transformation(extent={{196,-20},{246,10}})));
  equation
    connect(T_switch.y,onOffController. reference) annotation (Line(
        points={{61,-122},{-2,-122}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(onOffController.y,booleanToInteger. u) annotation (Line(
        points={{-25,-128},{-34,-128}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(booleanToInteger.y,product. u1) annotation (Line(
        points={{-57,-128},{-66.8,-128},{-66.8,-79.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TFloor.y,TBCBot. T) annotation (Line(
        points={{-173,-4},{-148.1,-4},{-148.1,-4},{-123.2,-4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(QBurner.y,product. u2) annotation (Line(
        points={{59,-84},{-57.2,-84},{-57.2,-79.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(product.y,add. u1) annotation (Line(
        points={{-62,-61.2},{-62,-44},{-60,-44}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(QPilot.y,add. u2) annotation (Line(
        points={{59,-48},{-48,-48},{-48,-44}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(add.y,burn. QBurner) annotation (Line(
        points={{-54,-21},{-54,2},{-43.69,2},{-43.69,9.64828}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TBCBot.port,burn. heaPorBot) annotation (Line(
        points={{-110,-4},{-56.74,-4},{-56.74,9.50345}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(TDryBul.y,burn. TDryBul) annotation (Line(
        points={{59,82},{14,82},{14,2},{-68.195,2},{-68.195,9.50345}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(tan.heaPorBot,burn. heaPorTop) annotation (Line(
        points={{-69.8415,49.8537},{-69.8415,51},{-69.5,51},{-69.5,40.2069}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(tan.Q_B,burn. Q_B) annotation (Line(
        points={{-59.517,49.8537},{-59.517,51},{-58.77,51},{-58.77,40.3517}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(tan.T_F0_y,burn. T_F0_y) annotation (Line(
        points={{-50.2679,50.9268},{-50.2679,51.5},{-49.635,51.5},{-49.635,
            40.2069}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(tan.cdot_G_y,burn. cdot_G_y) annotation (Line(
        points={{-41.234,50.9268},{-41.234,51.5},{-40.645,51.5},{-40.645,
            39.9172}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TDryBul.y,tan. TDryBul) annotation (Line(
        points={{59,82},{14,82},{14,104.371},{-31.5547,104.371}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TRadMea.y,tan. TRadMea)  annotation (Line(
        points={{59,44},{14,44},{14,70.4585},{-32.2,70.4585}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(T_sensor.T,onOffController. u) annotation (Line(
        points={{12,-7},{20,-7},{20,-134},{-2,-134}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(tan.heaPor[18], T_sensor.port) annotation (Line(
        points={{-31.6623,88.3805},{-12,88.3805},{-12,-7},{2,-7}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(realExpression4.y, tan.m_flow_in) annotation (Line(
        points={{-193,140},{-137.551,140},{-137.551,140.429},{-82.1019,140.429}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(realExpression.y, twoPipeDistributionSystem.InletTemp) annotation (
        Line(
        points={{153,-2},{180,-2},{180,-5},{209,-5}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-250,
              -200},{250,200}}),
                           graphics), Icon(coordinateSystem(preserveAspectRatio=true,
            extent={{-250,-200},{250,200}})));
  end StorageTankWithTwoPipe;

  model TanklessWithTwoPipe
    "Combines a tankless water heater with a two pipe distribution system"
    extends Modelica.Icons.Example;
    package Water = Buildings.Media.ConstantPropertyLiquidWater;
    TanklessWaterHeater.NonCondensingTanklessHeater nonCondensingTanklessHeater(
        T_Set_input=273.105 + 60)
      annotation (Placement(transformation(extent={{-14,2},{6,28}})));
    Modelica.Blocks.Sources.RealExpression Time(y=time)
      annotation (Placement(transformation(extent={{-80,4},{-60,24}})));
    Modelica.Blocks.Tables.CombiTable1Ds TAmb(
      tableOnFile=true,
      tableName="Ambient",
      columns={2},
      fileName="TanklessExampleAmbientTemperature.txt")
      annotation (Placement(transformation(extent={{-42,32},{-30,44}})));
    Modelica.Blocks.Tables.CombiTable1Ds TIn(
      tableOnFile=true,
      columns={2},
      tableName="Inlet",
      fileName="TanklessExampleInletTemperature.txt")
      annotation (Placement(transformation(extent={{-42,16},{-30,28}})));
    Modelica.Blocks.Tables.CombiTable1Ds pwrSig(
      tableOnFile=true,
      tableName="Power",
      columns={2},
      fileName="TanklessExamplePowerSignal.txt")
      annotation (Placement(transformation(extent={{-42,-16},{-30,-4}})));
    Modelica.Blocks.Sources.RealExpression realExpression4(y=
          twoPipeDistributionSystem.sum1.y)
      annotation (Placement(transformation(extent={{-48,-2},{-28,18}})));
    HWDis.BaseClasses.TwoPipeDistributionSystem twoPipeDistributionSystem(
        redeclare package Water = Water)
      annotation (Placement(transformation(extent={{14,2},{64,32}})));
  equation
    connect(Time.y,TIn. u) annotation (Line(
        points={{-59,14},{-52,14},{-52,22},{-43.2,22}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Time.y,TAmb. u) annotation (Line(
        points={{-59,14},{-52,14},{-52,38},{-43.2,38}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TAmb.y[1], nonCondensingTanklessHeater.AmbientTemperature)
      annotation (Line(
        points={{-29.4,38},{-26,38},{-26,25.92},{-16,25.92}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TIn.y[1], nonCondensingTanklessHeater.InletTemperature)
      annotation (Line(
        points={{-29.4,22},{-24.8,22},{-24.8,18.432},{-16,18.432}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pwrSig.y[1], nonCondensingTanklessHeater.pwrSig) annotation (Line(
        points={{-29.4,-10},{-26,-10},{-26,3.04},{-16,3.04}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Time.y,pwrSig. u) annotation (Line(
        points={{-59,14},{-52,14},{-52,-10},{-43.2,-10}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(realExpression4.y, nonCondensingTanklessHeater.DemandFlowRate)
      annotation (Line(
        points={{-27,8},{-24,8},{-24,11.36},{-16,11.36}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(nonCondensingTanklessHeater.T_Out, twoPipeDistributionSystem.InletTemp)
      annotation (Line(
        points={{7,17.808},{15.5,17.808},{15.5,17},{27,17}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}),
                           graphics), Icon(coordinateSystem(preserveAspectRatio=true,
            extent={{-100,-100},{100,100}})));
  end TanklessWithTwoPipe;
  annotation (uses(
      Modelica(version="3.2"),
      Buildings(version="1.2"),
      WaterHeaterLib(version="1"),
      TanklessWaterHeater(version="1")));
end CombinedExamples;
