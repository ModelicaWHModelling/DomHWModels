within ;
package WaterHeaterLib

  model WaterHeater "model of a gas water heater without burner"
    import SI = Modelica.SIunits;
    import Modelica.Constants;
    import WaterHeaterLib;

    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      "Medium in the component" annotation (choicesAllMatching=true);
    //   replaceable package MediumB = Modelica.Media.Interfaces.PartialMedium
    //     "Medium in the component" annotation (choicesAllMatching=true);

    import Modelica.Fluid.Types;
    import Modelica.Fluid.Types.Dynamics;
    import Modelica.Constants;
    parameter Modelica.SIunits.Volume VTan=1 "Tank volume";
    parameter Modelica.SIunits.Length DFlu=0.5 "diameter of the flue";
    parameter Modelica.SIunits.Length LFlu=1 "Length of flue";
  //  parameter Real TIn = 273.15 + 15;
    parameter Real perInA[nSeg] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    parameter Real perInB[nSeg] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    parameter Real perInC[nSeg] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    parameter Real timDelA[nSeg] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    parameter Real timDelB[nSeg] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    parameter Real timDelC[nSeg] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    parameter Buildings.HeatTransfer.Types.InteriorConvection conMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature
      "Convective heat transfer model for opaque constructions"
      annotation (Dialog(group="Convective heat transfer"));
    parameter Modelica.SIunits.Temperature T_Initial[nSeg] = {273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20,273.105 + 20};
  //  Modelica.SIunits.Temperature T_start;
    // Get the specific heat capacity of MediumB. This will be used later on for the calculation of Q_flow_tot
    Medium.SpecificHeatCapacity c_p=Medium.specificHeatCapacityCp(
        Medium.setState_pTX(
          Medium.p_default,
          Medium.T_default,
          Medium.X_default));

    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)"
      annotation (Dialog(tab="Assumptions"),Evaluate=true);
    parameter Modelica.SIunits.CoefficientOfHeatTransfer hFixed=3.0
      "Constant convection coefficient for opaque constructions" annotation (
        Dialog(group="Convective heat transfer", enable=(conMod == Buildings.HeatTransfer.Types.InteriorConvection.Fixed)));

    parameter Real QDotPilot = 158;

    parameter Medium.MassFlowRate m_flow_nominal "Nominal mass flow rate"
      annotation (Dialog(group="Nominal condition"));

    parameter Integer nSeg(min=2) = 20 "Number of volume segments";

    ////////////////////////////////////////////////////////////////////
    //   // Assumptions
    parameter Modelica.Fluid.Types.Dynamics energyDynamics=system.energyDynamics
      "Formulation of energy balance"
      annotation (Evaluate=true, Dialog(tab="Dynamics", group="Equations"));
    parameter Modelica.Fluid.Types.Dynamics massDynamics=energyDynamics
      "Formulation of mass balance"
      annotation (Evaluate=true, Dialog(tab="Dynamics", group="Equations"));

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

    Buildings.HeatTransfer.Sources.PrescribedHeatFlow        prescribedHeatFlow[
      nSeg]                 annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={102,-46})));

    ////////////////////////////////////////////////////////////////////

    Buildings.Rooms.Constructions.Construction flueWall[nSeg](
      each A=datFlueWall.A/nSeg,
      each til=datFlueWall.til,
      each final layers=datFlueWall.layers,
      each steadyStateInitial=datFlueWall.steadyStateInitial,
      each T_a_start=datFlueWall.T_a_start,
      each T_b_start=datFlueWall.T_b_start)
      "Heat conduction through partitions that have both sides inside the thermal zone"
      annotation (Placement(transformation(extent={{-118,-36},{-184,30}})));
    WaterHeaterLib.BaseClasses.InteriorWH heaFluWat[nSeg](
      each final A=datFlueWall.A/nSeg,
      each final til=datFlueWall.til,
      each final conMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
      each hFixed=hFixed) "Heat transfer between the flue wall and water"
      annotation (Placement(transformation(extent={{-62,34},{-32,4}})));

    Buildings.Rooms.Constructions.Construction tanJac[nSeg](
      each A=datTanEnv.A/nSeg,
      each til=datTanEnv.til,
      each final layers=datTanEnv.layers,
      each steadyStateInitial=datTanEnv.steadyStateInitial,
      each T_a_start=datTanEnv.T_a_start,
      each T_b_start=datTanEnv.T_b_start)
      "Representation of the jacket of the water heater"
      annotation (Placement(transformation(extent={{188,-30},{248,30}})));
    Buildings.Fluid.MixingVolumes.MixingVolume[nSeg] vol(
      redeclare each package Medium = Medium,
      each energyDynamics=energyDynamics,
      each massDynamics=massDynamics,
      each p_start=p_start,
      T_start=T_Initial[nSeg],
      each X_start=X_start,
      each C_start=C_start,
      each V=VTan/nSeg,
      each m_flow_nominal=m_flow_nominal,
      nPorts=1) "Tank segment"                           annotation (Placement(
          transformation(
          extent={{-22,-22},{22,22}},
          rotation=90,
          origin={82,42})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorBot
      "Heat port tank bottom (outside insulation). Leave unconnected for adiabatic condition"
      annotation (Placement(transformation(extent={{-14,-378},{14,-350}},
            rotation=0), iconTransformation(extent={{-48,-400},{-8,-360}})));

  protected
    constant Integer nPorts=2 "Number of ports of volume";
  //   Modelica.SIunits.HeatFlowRate deltaH_flow_BU[nSeg](each start=0)
  //     "Total heat enthalpy of zone i";
  //   Modelica.SIunits.HeatFlowRate deltaH_flow_F[nSeg](each start=0)
  //     "Heat enthalpy of zone induced by the flue wall";
  //   Modelica.SIunits.HeatFlowRate Q_flow_tot[nSeg]( each start=0)
  //    "Total heat flux that will be added to vol port ofr energy balance of zone i";

    Modelica.Blocks.Sources.RealExpression Q_flow_total[nSeg](y=-buoHeaTra.buoHeaTra)
      annotation (Placement(transformation(extent={{196,-62},{142,-30}})));
  public
    parameter Buildings.Rooms.BaseClasses.ParameterConstruction datFlueWall(
      each A=0,
      redeclare Buildings.HeatTransfer.Data.OpaqueConstructions.Brick120 layers,
      each til=0,
      each azi=0,
      T_a_start=333.15,
      T_b_start=333.15) "Data for partition construction"
                                                    annotation (Placement(
          transformation(extent={{582,340},{622,380}})), HideResult=true);

    parameter Buildings.Rooms.BaseClasses.ParameterConstruction datTanEnv(
      each A=0,
      redeclare Buildings.HeatTransfer.Data.OpaqueConstructions.Brick120 layers,
      each til=0,
      each azi=0,
      T_a_start=333.15,
      T_b_start=333.15) "Data for exterior construction"
                                                   annotation (Placement(
          transformation(extent={{520,342},{560,382}})),HideResult=true);

    Buildings.Rooms.Constructions.Construction tanTop(
      A=datTanEnvTop.A,
      til=datTanEnvTop.til,
      final layers=datTanEnvTop.layers,
      steadyStateInitial=datTanEnvTop.steadyStateInitial,
      T_a_start=datTanEnvTop.T_a_start,
      T_b_start=datTanEnvTop.T_b_start) "Representation of the top of the tank"
                                        annotation (Placement(transformation(
          extent={{-28,-28},{28,28}},
          rotation=90,
          origin={18,204})));
    parameter Buildings.Rooms.BaseClasses.ParameterConstruction datTanEnvTop(
      each A=0,
      redeclare Buildings.HeatTransfer.Data.OpaqueConstructions.Brick120 layers,
      each til=0,
      each azi=0,
      T_a_start=333.15,
      T_b_start=333.15) "Data for exterior construction"
                                                   annotation (Placement(
          transformation(extent={{520,400},{560,440}})), HideResult=true);

    Buildings.Rooms.Constructions.Construction tanBas(
      A=datTanEnvBot.A,
      til=datTanEnvBot.til,
      final layers=datTanEnvBot.layers,
      steadyStateInitial=datTanEnvBot.steadyStateInitial,
      T_a_start=datTanEnvBot.T_a_start,
      T_b_start=datTanEnvBot.T_b_start)
      "Representation of the base of the tank"
                                        annotation (Placement(transformation(
          extent={{30,-30},{-30,30}},
          rotation=90,
          origin={20,-282})));

    parameter Buildings.Rooms.BaseClasses.ParameterConstruction datTanEnvBot(
      each A=0,
      redeclare Buildings.HeatTransfer.Data.OpaqueConstructions.Brick120 layers,
      each til=0,
      each azi=0,
      T_a_start=333.15,
      T_b_start=333.15) "Data for exterior construction"
                                                   annotation (Placement(
          transformation(extent={{580,400},{620,440}})), HideResult=true);

    // parameters defined for the water heater model.
    parameter Real h_cw_B_cons=1
      "value should be obtained from Mac Gregor & Emery Journal of Heat Transfer (page 8) --fixme";
    parameter Modelica.SIunits.MassFlowRate m_flow_sr=0.01*0.063
      "Mass flow rate for secondary recirculation in Stagnant region (page 8)";
    parameter Real c_sr=2
      "Empirical factor for scaling mass flow rate for secondary recirculation in stirred region(page 8)";
    parameter Real c_wB=1/15
      "Empirical value determined based on experimental data (see page 8)";
    parameter Real c_wI=1/2
      "Empirical value determined based on experimental data (see page 8)";
    parameter Real h_WF_cons=2
      "Convective heat transfer coefficient between water and flue wall (page 8) --fixme";
    // the assumption is that there is no recirculation in zone nSeg at the top of tank
    final parameter Modelica.SIunits.MassFlowRate m_flow_C[nSeg]=cat(
          1,
          c_sr*m_flow_sr*ones(nSeg - 1),
          {m_flow_sr}) "Secondary recirculation mass flow ratein all zones";

  //   Modelica.SIunits.Temperature T_HB(start=273.15 + 30)
  //    "Effective temperature induced by the heat flux into the tank through the base";
  //   Modelica.SIunits.MassFlowRate m_flow_B
  //    "Mass flow rate induced by the heat flux into the tank through the base";
  //   Modelica.SIunits.Temperature T_H[nSeg](each start=273.15 + 30)
  //    "Temperature of the flue wall for each zone";
  //   Modelica.SIunits.MassFlowRate m_flow_F[nSeg](each start=0)
  //    "Mass flow rate induced by the flue for each zone";

  //   Modelica.SIunits.HeatFlowRate Q_flow_W[nSeg]( each start=0)
  //     "Heat flow rate leaving zone i";
  //   Modelica.SIunits.HeatFlowRate Q_flow_WB "Heat flow rate from the base";

    Modelica.SIunits.Temperature T_WL_mean
      "mean temperature along the flue wall";

     Modelica.SIunits.Temperature T_F[nSeg]( each start = 0)
      "Temperature of flue wall";
    parameter Real h_cv_F=10
      "Convective heat transfer coefficient between flue gas and flue wall (see page 17)--fixme";
    Real smoDel = 0.00001;

    WaterHeaterLib.BaseClasses.InteriorWH heaBasWat(
      final A=datTanEnvBot.A,
      final til=datTanEnvBot.til,
      hFixed=hFixed,
      final conMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature)
      "Heat transfer between the base of the tank and the water"
                                 annotation (Placement(transformation(
          extent={{14,-14},{-14,14}},
          rotation=-90,
          origin={0,-50})));
    WaterHeaterLib.BaseClasses.InteriorWH convConBou3(
      final A=datTanEnvTop.A,
      final til=datTanEnvTop.til,
      final conMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
      each hFixed=hFixed) "Convective heat transfer" annotation (Placement(
          transformation(
          extent={{-14,-14},{14,14}},
          rotation=-90,
          origin={0,110})));

    WaterHeaterLib.BaseClasses.InteriorWH heaWatJac[nSeg](
      each final A=datTanEnv.A/nSeg,
      each final til=datTanEnv.til,
      each final conMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
      each hFixed=hFixed) "Heat transfer between the water and the jacket"
      annotation (Placement(transformation(extent={{166,34},{138,6}})));

    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature flueTemperature[
      nSeg] annotation (Placement(transformation(extent={{-292,4},{-262,34}})));

    Modelica.Blocks.Sources.RealExpression flueTemp[nSeg](y=T_F_avg)
      annotation (Placement(transformation(extent={{-334,4},{-304,34}})));

    Modelica.Blocks.Interfaces.RealVectorInput m_flow_in[nSeg] annotation (
        Placement(transformation(extent={{-178,444},{-138,484}}),
          iconTransformation(extent={{-162,444},{-122,484}})));
    WaterHeaterLib.BaseClasses.draHeaTra draHeaTra(
      nSeg=nSeg,
      redeclare package Medium = Medium,
      perInA=perInA,
      perInB=perInB,
      perInC=perInC,
      timDelA=timDelA,
      timDelB=timDelB,
      timDelC=timDelC)
      "Calculates the heat transfer in each segment caused by a hot water draw"
                                                                    annotation (
        Placement(transformation(
          extent={{-23,-23},{23,23}},
          rotation=-90,
          origin={-141,371})));
    Modelica.Blocks.Sources.RealExpression draHea[nSeg](y=draHeaTra.draHeaTra)
                                                        annotation (Placement(
          transformation(
          extent={{-28,-14},{28,14}},
          rotation=180,
          origin={170,-84})));
    Buildings.HeatTransfer.Sources.PrescribedHeatFlow        prescribedHeatFlow1[
      nSeg] annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={104,-84})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor[
      nSeg] annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-70,396})));
    Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor
      "Sensor reporting the heat transfer between the base of the tank and the water"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={0,-152})));
    Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1[nSeg]
      "Sensor reporting the heat flow between the flu wall and the water"
      annotation (Placement(transformation(
          extent={{-13,-13},{13,13}},
          rotation=180,
          origin={-93,19})));
    WaterHeaterLib.BaseClasses.InteriorWH heaWatFit[nSeg](
      each hFixed=hFixed,
      each conMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
      each final til=datTanEnv.til,
      each final A=datTanEnv.A/nSeg)
      "Heat transfer between the water and assorted fittings (inlet/outlet pipe, PRV, drain)"
      annotation (Placement(transformation(extent={{238,132},{210,104}})));
    Modelica.Blocks.Sources.RealExpression finCoef[nSeg](each y=0.2)
      "--fixme see and add the correct coefficient as on page 19 --fixme"
      annotation (Placement(transformation(extent={{344,184},{316,214}})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor T_WL[nSeg]
      "flue wall temperature" annotation (Placement(transformation(
          extent={{12,-12},{-12,12}},
          rotation=0,
          origin={-226,-32})));
    Modelica.SIunits.Temperature T_WL_avg[nSeg];
    Modelica.SIunits.Temperature T_F_avg;

    Modelica.Blocks.Sources.RealExpression h_cw_B(y=h_cw_B_cons)
      annotation (Placement(transformation(extent={{-438,-64},{-390,-36}})));
    Modelica.Blocks.Sources.RealExpression h_WF[nSeg](each y=h_WF_cons)
      annotation (Placement(transformation(extent={{-360,256},{-320,288}})));
    Modelica.Blocks.Math.Gain gain2[nSeg](each k=2)
      annotation (Placement(transformation(extent={{-220,262},{-200,282}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPor[nSeg]
      "Heat port for sensor" annotation (Placement(transformation(extent={{638,-148},
              {656,-130}},      rotation=0), iconTransformation(extent={{306,-42},
              {348,0}})));
    Buildings.HeatTransfer.Convection.Interior convJacAmb[nSeg](
      each conMod=conMod,
      each hFixed=hFixed,
      each final A=datTanEnv.A/nSeg,
      each final til=datTanEnv.til)
      "Convective heat transfer between the tank and the surroundings"
      annotation (Placement(transformation(extent={{308,62},{336,90}})));
  public
    Modelica.Thermal.HeatTransfer.Components.ThermalCollector theCol(m=nSeg)
      "Connector to assign multiple heat ports to one heat port" annotation (
        Placement(transformation(
          extent={{-13,-13},{13,13}},
          rotation=90,
          origin={399,43})));
    WaterHeaterLib.BaseClasses.LongWaveRadiationExchange radJacAmb[nSeg](each A=
         datTanEnv.A/nSeg)
      "Radiative heat exchange between the tank and the surroundings"
      annotation (Placement(transformation(extent={{342,-16},{316,-42}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Tair
      annotation (Placement(transformation(extent={{456,36},{436,56}})));
    Modelica.Blocks.Interfaces.RealInput TDryBul annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={658,46}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={328,128})));
    Modelica.Blocks.Interfaces.RealInput TRadMea  annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={660,-82}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={322,-188})));
    Modelica.Blocks.Routing.Replicator replicator1(nout=nSeg)
      annotation (Placement(transformation(extent={{436,-96},{406,-66}})));
    Modelica.Blocks.Sources.RealExpression absIRJac2[nSeg](each y=datTanEnv.layers.absIR_b)
      annotation (Placement(transformation(extent={{440,-48},{388,-12}})));
    WaterHeaterLib.BaseClasses.InteriorWH heaGasFlu[nSeg](
      each hFixed=hFixed,
      each final conMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
      each final A=datFlueWall.A/nSeg,
      each final til=datFlueWall.til)
      "Heat transfer between the hot gas and flue wall" annotation (Placement(
          transformation(
          extent={{-17,-17},{17,17}},
          rotation=180,
          origin={-231,19})));

    Modelica.Blocks.Sources.RealExpression heaCoe[nSeg](each y=h_cv_F)
      "combined convective and radiative coefficient -- fixme"
      annotation (Placement(transformation(extent={{-336,42},{-306,72}})));
    Buildings.HeatTransfer.Convection.Interior convTopAmb(
      each conMod=conMod,
      each hFixed=hFixed,
      each final A=datTanEnvTop.A,
      each final til=datTanEnvTop.til)
      "Convective heat transfer between the top of the tank and the surroundings"
                                                                  annotation (
        Placement(transformation(
          extent={{-14,-14},{14,14}},
          rotation=90,
          origin={-44,328})));
    WaterHeaterLib.BaseClasses.LongWaveRadiationExchange radTopAmb(A=
          datTanEnvTop.A)
      "Radiative heat transfer between the top of the tank and the surroundings"
                         annotation (Placement(transformation(
          extent={{13,13},{-13,-13}},
          rotation=90,
          origin={41,327})));
    Modelica.Blocks.Sources.RealExpression absIRJac1(y=datTanEnv.layers.absIR_b)
      annotation (Placement(transformation(extent={{136,332},{72,370}})));
    Modelica.Blocks.Sources.RealExpression heaTraBas(y=-tanBas.opa_b.Q_flow)
      "Expression of the heat transfer rate from the gas to the base"
      annotation (Placement(transformation(
          extent={{22,-22},{-22,22}},
          rotation=90,
          origin={80,-284})));
    Modelica.Blocks.Interfaces.RealOutput Q_B "heat flow rate of the base"
      annotation (Placement(transformation(
          extent={{-23,-23},{23,23}},
          rotation=270,
          origin={81,-383}), iconTransformation(
          extent={{-23,-23},{23,23}},
          rotation=270,
          origin={68,-380})));
    Modelica.Blocks.Interfaces.RealInput T_F0_y annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={232,-380}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={154,-370})));
    Modelica.Blocks.Interfaces.RealInput cdot_G_y annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={318,-380}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={238,-370})));
    WaterHeaterLib.BaseClasses.buoHeaTra buoHeaTra(
      nSeg=nSeg, QDotPilot=QDotPilot)
      "Calculates the heat transfer between segments in the heater caused by buoyant flow"
                                                   annotation (Placement(
          transformation(
          extent={{-18,-18},{18,18}},
          rotation=270,
          origin={70,142})));
    Modelica.Fluid.Sources.FixedBoundary boundary[nSeg](
      nPorts=1,
      use_p=true,
      redeclare package Medium = Medium,
      p=347700) annotation (Placement(transformation(
          extent={{-21,-25},{21,25}},
          rotation=270,
          origin={131,197})));
    Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor2
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,264})));
    Modelica.Blocks.Interfaces.RealInput TIn
      annotation (Placement(transformation(extent={{-458,158},{-418,198}})));
  equation

    for i in (1:nSeg) loop

      T_WL_avg[i] = sum(T_WL[i:nSeg].T)/(nSeg-i+1);

      T_F[i] = (T_F0_y - T_WL_avg[i])*exp(-((h_cv_F*Modelica.Constants.pi*DFlu/cdot_G_y)
      *((nSeg-i+1)*LFlu/nSeg))) + T_WL[i].T;

    end for;

    T_F_avg = sum(T_F[1:nSeg])/nSeg;
    T_WL_mean =  sum(T_WL[1:nSeg].T)/nSeg;

    connect(prescribedHeatFlow.port, vol.heatPort) annotation (Line(
        points={{92,-46},{82,-46},{82,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heaBasWat.fluid, vol[nSeg].heatPort)   annotation (Line(
        points={{7.95401e-016,-36},{7.95401e-016,20},{82,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(convConBou3.solid,tanTop. opa_a) annotation (Line(
        points={{4.34812e-015,124},{4.34812e-015,176},{-0.666667,176}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heaWatJac.solid, tanJac.opa_a)   annotation (Line(
        points={{166,20},{188,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heaWatJac.fluid, vol.heatPort)   annotation (Line(
        points={{138,20},{82,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heatFlowSensor.port_a, heaBasWat.solid)   annotation (Line(
        points={{1.83697e-015,-142},{0,-130},{-2.66453e-015,-108},{
            -4.34812e-015,-108},{-4.34812e-015,-64}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heatFlowSensor.port_b, tanBas.opa_a)  annotation (Line(
        points={{-1.83697e-015,-162},{-1.83697e-015,-252},{3.55271e-015,-252}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(finCoef.y, heaWatFit.u)   annotation (Line(
        points={{314.6,199},{224,199},{224,134.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(heaWatFit.fluid, vol.heatPort)   annotation (Line(
        points={{210,118},{114,118},{114,20},{82,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(convConBou3.fluid, vol[1].heatPort) annotation (Line(
        points={{-7.95401e-016,96},{0,96},{0,20},{82,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(vol.heatPort, heaPor) annotation (Line(
        points={{82,20},{82,-139},{647,-139}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(Tair.port, theCol.port_b) annotation (Line(
        points={{436,46},{436,43},{412,43}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(TRadMea, replicator1.u)  annotation (Line(
        points={{660,-82},{536,-82},{536,-81},{439,-81}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Tair.T, TDryBul) annotation (Line(
        points={{458,46},{658,46}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(heaWatFit.solid, theCol.port_a)   annotation (Line(
        points={{238,118},{386,118},{386,43}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(radJacAmb.port, tanJac.opa_b)            annotation (Line(
        points={{315.48,-29.26},{276.74,-29.26},{276.74,20},{248.2,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(convJacAmb.fluid, theCol.port_a)  annotation (Line(
        points={{336,76},{360,76},{360,43},{386,43}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(convJacAmb.solid, tanJac.opa_b)  annotation (Line(
        points={{308,76},{276,76},{276,20},{248.2,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(flueTemp.y, flueTemperature.T) annotation (Line(
        points={{-302.5,19},{-295,19}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(flueTemperature.port, heaGasFlu.fluid)   annotation (Line(
        points={{-262,19},{-246,20},{-248,19}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heaCoe.y, heaGasFlu.u)    annotation (Line(
        points={{-304.5,57},{-231,57},{-231,39.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(heaGasFlu.solid, flueWall.opa_b)   annotation (Line(
        points={{-214,19},{-192,20},{-184.22,20},{-184.22,19}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(flueWall.opa_a, heatFlowSensor1.port_b) annotation (Line(
        points={{-118,19},{-106,19}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heatFlowSensor1.port_a, heaFluWat.solid)   annotation (Line(
        points={{-80,19},{-62,19}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heaFluWat.fluid, vol.heatPort)   annotation (Line(
        points={{-32,19},{1,19},{1,20},{82,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theCol.port_b, convTopAmb.fluid)   annotation (Line(
        points={{412,43},{420,43},{420,374},{-44,374},{-44,342}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(Q_flow_total.y, prescribedHeatFlow.Q_flow) annotation (Line(
        points={{139.3,-46},{112,-46}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(gain2[1].y, convConBou3.u) annotation (Line(
        points={{-199,272},{-76,272},{-76,110},{-16.8,110}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(T_WL.port, flueWall.opa_b) annotation (Line(
        points={{-214,-32},{-184.22,-32},{-184.22,19}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(tanBas.opa_b, heaPorBot)  annotation (Line(
        points={{-3.55271e-015,-312.2},{-3.55271e-015,-337.1},{1.77636e-015,
            -337.1},{1.77636e-015,-364}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heaTraBas.y, Q_B)      annotation (Line(
        points={{80,-308.2},{81,-308.2},{81,-383}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(h_WF.y, gain2.u) annotation (Line(
        points={{-318,272},{-222,272}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(heaFluWat.u, gain2.y)   annotation (Line(
        points={{-47,37},{-47,60},{-76,60},{-76,272},{-199,272}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(heaWatJac.u, gain2.y)   annotation (Line(
        points={{152,36.8},{152,80},{-76,80},{-76,272},{-199,272}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(m_flow_in, draHeaTra.mFloIn) annotation (Line(
        points={{-158,464},{-152.5,464},{-152.5,398.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(draHea.y, prescribedHeatFlow1.Q_flow) annotation (Line(
        points={{139.2,-84},{114,-84}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(prescribedHeatFlow1.port, vol.heatPort) annotation (Line(
        points={{94,-84},{82,-84},{82,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(vol.heatPort, temperatureSensor.port) annotation (Line(
        points={{82,20},{-24,20},{-24,234},{-70,234},{-70,386}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(temperatureSensor.T, draHeaTra.TWat) annotation (Line(
        points={{-70,406},{-70,428},{-124.44,428},{-124.44,398.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(absIRJac2.y, radJacAmb.u)            annotation (Line(
        points={{385.4,-30},{365,-30},{365,-29},{344.6,-29}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(radJacAmb.T_In, replicator1.y)            annotation (Line(
        points={{329,-44.6},{329,-80},{380,-80},{380,-81},{404.5,-81}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(absIRJac1.y, radTopAmb.u)            annotation (Line(
        points={{68.8,351},{41,351},{41,342.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(radTopAmb.T_In, TRadMea)            annotation (Line(
        points={{56.6,327},{484,327},{484,-82},{660,-82}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(h_cw_B.y, heaBasWat.u)   annotation (Line(
        points={{-387.6,-50},{-16.8,-50}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(heatFlowSensor1.Q_flow, buoHeaTra.QDotFlu) annotation (Line(
        points={{-93,32},{-88,32},{-88,163.6},{66.4,163.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(buoHeaTra.QDotBas, heatFlowSensor.Q_flow) annotation (Line(
        points={{52,163.6},{52,166},{20,166},{20,-136},{-10,-136},{-10,-152}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(buoHeaTra.TWat, vol.heatPort) annotation (Line(
        points={{76.48,161.08},{-34,161.08},{-34,62},{-12,62},{-12,20},{82,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(vol.ports[1], boundary.ports[1]) annotation (Line(
        points={{104,42},{131,42},{131,176}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(tanTop.opa_b, heatFlowSensor2.port_a) annotation (Line(
        points={{-0.666667,232.187},{-0.666667,242.094},{-6.12323e-016,242.094},
            {-6.12323e-016,254}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heatFlowSensor2.port_b, radTopAmb.port) annotation (Line(
        points={{6.12323e-016,274},{6.12323e-016,298},{41.26,298},{41.26,313.48}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(heatFlowSensor2.port_b, convTopAmb.solid) annotation (Line(
        points={{6.12323e-016,274},{6.12323e-016,298},{-44,298},{-44,314}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heatFlowSensor2.Q_flow, buoHeaTra.QLosTop) annotation (Line(
        points={{10,264},{84.4,264},{84.4,163.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(draHeaTra.TIn, TIn) annotation (Line(
        points={{-133.64,398.6},{-133.64,432},{-380,432},{-380,178},{-438,178}},
        color={0,0,127},
        smooth=Smooth.None));
                                                                annotation (
        Placement(transformation(extent={{322,444},{362,484}}),
          iconTransformation(extent={{322,444},{362,484}})),
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-420,-360},{640,
              460}}),     graphics),
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
</html>", revisions="<html>
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
  end WaterHeater;

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
    parameter Real Deadband "The total width of the deadband on the thermostat";
    parameter Real UA "The UA value of the storage tank";
    parameter Real EffTan = 0.25
      "Heat exhange effectiveness of the storage tank";
    parameter Real VTan = 0.15 "Volume of the tank";
    parameter Real QDotPilot(unit = "W") = 120
      "Pilot light heat consumption rate";
    parameter Real perQFlu = 1/3
      "Percentage of heat transfer occuring in the flue";
    parameter Real perQBas = 2/3
      "Percentage of heat transfer occuring in the base";
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
    Hybrid.HeatersUsed.EditedBaseClasses.HyDra draHeaTra(nSeg=nSeg, redeclare
        package Medium = Medium)
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
    Hybrid.HeatersUsed.EditedBaseClasses.cirHeaTra cirHeaTra(nSeg=nSeg,
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
    Modelica.Blocks.Interfaces.RealInput QDotIn "Heat entering the flue"
      annotation (Placement(transformation(extent={{-494,324},{-422,396}})));
    Modelica.Blocks.Sources.RealExpression realExpression1[nSeg](y=buoHeaTraMod.buoHeaTra)
      annotation (Placement(transformation(
          extent={{-27,-16},{27,16}},
          rotation=180,
          origin={169,-80})));
    Buildings.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow2[nSeg]
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={104,-80})));
    Hybrid.HeatersUsed.EditedBaseClasses.UALoss uALoss(nSeg=nSeg, UA=UA)
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
    Modelica.Blocks.Math.Gain QPerFlu(k=perQFlu)
      "Percentage of total heat transfer taking place in the flue"
      annotation (Placement(transformation(extent={{-372,360},{-352,380}})));
    Modelica.Blocks.Math.Gain QPerBas(k=perQBas)
      "Percentage of heat transfer passing through the base"
      annotation (Placement(transformation(extent={{-366,324},{-346,344}})));
    WaterHeaterLib.BaseClasses.buoHeaTraMod buoHeaTraMod(
      redeclare package Medium = Medium,
      nSeg=nSeg,
      QDotPilot=QDotPilot)
      annotation (Placement(transformation(extent={{-260,338},{-222,376}})));
  equation

    TOutRec = vol[RecircOutSeg].T;
    TOutDra = vol[1].T;

    connect(m_flow_in, draHeaTra.mFloIn) annotation (Line(
        points={{-158,464},{-152.5,464},{-152.5,398.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(draHea.y, prescribedHeatFlow1.Q_flow) annotation (Line(
        points={{139.2,-4},{132.9,-4},{132.9,-4},{126.6,-4},{126.6,-4},{114,-4}},
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
    connect(realExpression1.y, prescribedHeatFlow2.Q_flow) annotation (Line(
        points={{139.3,-80},{114,-80}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(prescribedHeatFlow2.port, vol.heatPort) annotation (Line(
        points={{94,-80},{82,-80},{82,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(temperatureSensor.T, uALoss.TWat) annotation (Line(
        points={{-63,406},{-64,406},{-64,420},{-92,420},{-92,276},{-340,276},{
            -340,234.8},{-318.4,234.8}},
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
    connect(QDotIn, QPerFlu.u) annotation (Line(
        points={{-458,360},{-416,360},{-416,370},{-374,370}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(QDotIn, QPerBas.u) annotation (Line(
        points={{-458,360},{-416,360},{-416,334},{-368,334}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(QPerBas.y, buoHeaTraMod.QDotBas) annotation (Line(
        points={{-345,334},{-286,334},{-286,338},{-263.8,338}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(QPerFlu.y, buoHeaTraMod.QDotFlu) annotation (Line(
        points={{-351,370},{-312,370},{-312,353.2},{-263.8,353.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(vol.heatPort, buoHeaTraMod.TWat) annotation (Line(
        points={{82,20},{-24,20},{-24,232},{-62,232},{-62,306},{-278,306},{-278,
            363.84},{-261.14,363.84}},
        color={191,0,0},
        smooth=Smooth.None));
                                                                annotation (
        Placement(transformation(extent={{322,444},{362,484}}),
          iconTransformation(extent={{322,444},{362,484}})),
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-420,-360},{
              640,460}}), graphics),
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
</html>", revisions="<html>
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

  package Examples

    model WaterHeater "Test model for water heater"
      import WaterHeaterLib;
      extends Modelica.Icons.Example;
      import Modelica.SIunits;
      package Medium = Modelica.Media.Water.WaterIF97_ph "Medium model";
      parameter Integer nStaRef=6 "Number of states in a reference material";
    //  parameter Integer nSeg=tan.nSeg;

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
    //  parameter Real InletWaterTemp = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "InletWaterTemp");
      parameter Real FlueToWaterConvectionCoefficient = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "FlueToWaterConvectionCoefficient");
      parameter Real GasToFlueConvectionCoefficient = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "GasToFlueConvectionCoefficient");
      parameter Real TankDiameter = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "TankDiameter");
      parameter Real GasToBaseConvectionCoefficient = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "GasToBaseConvectionCoefficient");
      parameter Real FuelHigherHeatingValue = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "FuelHigherHeatingValue");
      parameter Real FuelLowerHeatingValue = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "FuelLowerHeatingValue");
      parameter Real StoichiometricAirFuelRatio = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "StoichiometricAirFuelRatio");
      parameter Real ExcessAir = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "ExcessAir");
      parameter Real GasSpecificHeat = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "GasSpecificHeat");
    //  parameter Real InitialTemp = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "T_Initial");
      parameter Integer nSeg = 20;//WaterHeaterLib.BaseClasses.readIntegerParameter("StorageExampleParameters.txt", "nSeg");
    //  parameter Integer ThermostatHeight = WaterHeaterLib.BaseClasses.readIntegerParameter("StorageExampleParameters.txt", "ThermostatHeight");

      inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
          massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) annotation (
          Placement(transformation(extent={{-140,-138},{-120,-118}})));
      Buildings.HeatTransfer.Sources.PrescribedTemperature TBCBot
        "Boundary condition for tank" annotation (Placement(transformation(
            extent={{6,-6},{-6,6}},
            rotation=180,
            origin={-56,-8})));

      Modelica.Blocks.Sources.Constant QBurner(k=12000) annotation (Placement(
            transformation(extent={{140,-78},{120,-98}}, rotation=0)));

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
        annotation (Placement(transformation(extent={{-142,-98},{-124,-80}})));
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
        annotation (Placement(transformation(extent={{-114,-98},{-96,-80}})));
      Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor T_sensor
        "switch temperature"
        annotation (Placement(transformation(extent={{62,-16},{72,-6}})));
      Modelica.Blocks.Logical.OnOffController onOffController(bandwidth=12)
        annotation (Placement(transformation(extent={{56,-142},{36,-122}})));
      Modelica.Blocks.Sources.Constant T_switch(k=273.105 + 48)
        annotation (Placement(transformation(extent={{142,-136},{122,-116}})));
      Modelica.Blocks.Math.BooleanToReal booleanToInteger
        annotation (Placement(transformation(extent={{24,-142},{4,-122}})));
      Modelica.Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-8,-8},{8,8}},
            rotation=90,
            origin={-2,-74})));
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
        annotation (Placement(transformation(extent={{-84,-98},{-66,-80}})));
      Modelica.Blocks.Sources.Constant TFloor(k=T_Floor)
        annotation (Placement(transformation(extent={{-134,-18},{-114,2}})));
      Modelica.Blocks.Sources.Constant QPilot(k=158) annotation (Placement(
            transformation(extent={{140,-46},{120,-66}}, rotation=0)));
      Modelica.Blocks.Math.Add add annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={6,-42})));
      BaseClasses.Burner.Gas burn(
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
        deltaHc_H=FuelHigherHeatingValue,
        deltaHc_L=FuelLowerHeatingValue,
        stoich=StoichiometricAirFuelRatio,
        EA=ExcessAir,
        cp_G=GasSpecificHeat,
        h_GB=450)
        annotation (Placement(transformation(extent={{-24,0},{34,42}})));
      WaterHeaterLib.WaterHeater tan(
        allowFlowReversal=false,
        m_flow_nominal=0.001,
        energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
        massDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
        redeclare package Medium = Medium,
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
        h_WF_cons=FlueToWaterConvectionCoefficient,
        h_cv_F=GasToFlueConvectionCoefficient,
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
        nSeg=20,
        T_Initial={321.85,321.85,321.85,321.85,321.85,321.85,321.85,321.85,321.85,321.85,
            321.85,321.85,321.85,321.85,321.85,321.85,321.85,321.85,321.85,321.85})
        annotation (Placement(transformation(extent={{-52,48},{62,136}})));

      Modelica.Blocks.Tables.CombiTable1Ds WaterFlow[nSeg](
        tableOnFile=true,
        tableName="Inputs",
        fileName="WaterFromTest16.txt")
        annotation (Placement(transformation(extent={{-112,126},{-92,146}})));
      Modelica.Blocks.Sources.RealExpression Time[nSeg](y=time)
        annotation (Placement(transformation(extent={{-154,126},{-134,146}})));
      Modelica.Blocks.Sources.RealExpression realExpression(y=time)
        annotation (Placement(transformation(extent={{-148,38},{-128,58}})));
      Modelica.Blocks.Tables.CombiTable1Ds ValidationData(
        tableOnFile=true,
        tableName="Data",
        fileName="ValidationDataFromTest16.txt",
        columns=2:12)
        annotation (Placement(transformation(extent={{-114,38},{-94,58}})));
      Modelica.Blocks.Tables.CombiTable1Ds Inlet(
        tableOnFile=true,
        tableName="Inputs",
        fileName="InletFromTest16.txt")
        annotation (Placement(transformation(extent={{-114,96},{-94,116}})));
      Modelica.Blocks.Tables.CombiTable1Ds Ambient(
        tableOnFile=true,
        tableName="Inputs",
        fileName="AmbientFromTest16.txt")
        annotation (Placement(transformation(extent={{-114,68},{-94,88}})));
      WaterHeaterLib.BaseClasses.TimeBasedIfGain timeBasedIfGain(
        TimeLow=122776,
        TimeHigh=164298,
        InIfGain=0,
        OutIfGain=0.85) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={16,-12})));
      Modelica.Blocks.Math.Gain gain(k=1.375) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={60,-88})));
    equation

      connect(T_switch.y, onOffController.reference) annotation (Line(
          points={{121,-126},{58,-126}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(onOffController.y, booleanToInteger.u) annotation (Line(
          points={{35,-132},{26,-132}},
          color={255,0,255},
          smooth=Smooth.None));

      connect(booleanToInteger.y, product.u1) annotation (Line(
          points={{3,-132},{-6.8,-132},{-6.8,-83.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TFloor.y, TBCBot.T) annotation (Line(
          points={{-113,-8},{-88.1,-8},{-88.1,-8},{-63.2,-8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y, add.u1) annotation (Line(
          points={{-2,-65.2},{-2,-54},{-8.88178e-016,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TBCBot.port, burn.heaPorBot) annotation (Line(
          points={{-50,-8},{3.26,-8},{3.26,5.50345}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(tan.heaPorBot, burn.heaPorTop) annotation (Line(
          points={{-9.84151,45.8537},{-9.84151,47},{-9.5,47},{-9.5,36.2069}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(tan.Q_B, burn.Q_B) annotation (Line(
          points={{0.483019,45.8537},{0.483019,47},{1.23,47},{1.23,36.3517}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(tan.T_F0_y, burn.T_F0_y) annotation (Line(
          points={{9.73208,46.9268},{9.73208,47.5},{10.365,47.5},{10.365,
              36.2069}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(tan.cdot_G_y, burn.cdot_G_y) annotation (Line(
          points={{18.766,46.9268},{18.766,47.5},{19.355,47.5},{19.355,35.9172}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(tan.heaPor[19], T_sensor.port) annotation (Line(
          points={{28.3377,86.2961},{46,86.2961},{46,-11},{62,-11}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(T_sensor.T, onOffController.u) annotation (Line(
          points={{72,-11},{80,-11},{80,-138},{58,-138}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Time.y, WaterFlow.u)               annotation (Line(
          points={{-133,136},{-114,136}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(realExpression.y, ValidationData.u)
                                                 annotation (Line(
          points={{-127,48},{-116,48}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(realExpression.y, Ambient.u) annotation (Line(
          points={{-127,48},{-122,48},{-122,78},{-116,78}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression.y, Inlet.u) annotation (Line(
          points={{-127,48},{-122,48},{-122,106},{-116,106}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Inlet.y[1], tan.TIn) annotation (Line(
          points={{-93,106},{-73.4679,106},{-73.4679,105.737},{-53.9358,105.737}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Ambient.y[1], burn.TDryBul) annotation (Line(
          points={{-93,78},{-26,78},{-26,0},{-8.195,0},{-8.195,5.50345}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Ambient.y[1], tan.TDryBul) annotation (Line(
          points={{-93,78},{-62,78},{-62,142},{36,142},{36,100.371},{28.4453,
              100.371}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(Ambient.y[1], tan.TRadMea) annotation (Line(
          points={{-93,78},{-62,78},{-62,142},{36,142},{36,66.4585},{27.8,
              66.4585}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(QPilot.y, add.u2) annotation (Line(
          points={{119,-56},{102,-56},{102,-66},{12,-66},{12,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(timeBasedIfGain.u, add.y) annotation (Line(
          points={{16,-24},{12,-24},{12,-31},{6,-31}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(timeBasedIfGain.y, burn.QBurner) annotation (Line(
          points={{15.8,-0.8},{15.8,2.6},{16.31,2.6},{16.31,5.64828}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QBurner.y, gain.u) annotation (Line(
          points={{119,-88},{72,-88}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gain.y, product.u2) annotation (Line(
          points={{49,-88},{2.8,-88},{2.8,-83.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(WaterFlow.y[1], tan.m_flow_in) annotation (Line(
          points={{-91,136},{-56.5509,136},{-56.5509,136.429},{-22.1019,136.429}},

          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-150,-150},
                {150,150}}), graphics),
        __Dymola_Commands(file=
              "modelica://Buildings/Resources/Scripts/Dymola/Fluid/Storage/Examples/Stratified.mos"
            "Simulate and plot"),
        Documentation(info="<html>
This test model compares two tank models. The only difference between
the two tank models is that one uses the third order upwind discretization
scheme that reduces numerical diffusion that is induced when connecting 
volumes in series.
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-150,-150},{
                150,150}})));
    end WaterHeater;

    model StorageTankWithFan
      import WaterHeaterLib;
      extends Modelica.Icons.Example;
      import Modelica.SIunits;
      package Medium = Modelica.Media.Water.WaterIF97_ph "Medium model";
      parameter Integer nStaRef=6 "Number of states in a reference material";
    //  parameter Integer nSeg=tan.nSeg;

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
    //  parameter Real InitialTemp = Modelica.Utilities.Examples.readRealParameter("StorageExampleParameters.txt", "T_Initial");
      parameter Integer nSeg = WaterHeaterLib.BaseClasses.readIntegerParameter("StorageExampleParameters.txt", "nSeg");
    //  parameter Integer ThermostatHeight = WaterHeaterLib.BaseClasses.readIntegerParameter("StorageExampleParameters.txt", "ThermostatHeight");
      parameter Real QEleIdl = WaterHeaterLib.BaseClasses.readIntegerParameter("StorageExampleParameters.txt", "QEleIdl");
      parameter Real QEleAct = WaterHeaterLib.BaseClasses.readIntegerParameter("StorageExampleParameters.txt", "QEleAct");

      inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
          massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) annotation (
          Placement(transformation(extent={{-134,-138},{-114,-118}})));
      Buildings.HeatTransfer.Sources.PrescribedTemperature TBCBot
        "Boundary condition for tank" annotation (Placement(transformation(
            extent={{6,-6},{-6,6}},
            rotation=180,
            origin={-50,-8})));
      Modelica.Blocks.Sources.Constant QBurner(k=11000) annotation (Placement(
            transformation(extent={{146,-78},{126,-98}}, rotation=0)));
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
        annotation (Placement(transformation(extent={{-136,-98},{-118,-80}})));
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
        annotation (Placement(transformation(extent={{-108,-98},{-90,-80}})));
      Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor T_sensor
        "switch temperature"
        annotation (Placement(transformation(extent={{68,-16},{78,-6}})));
      Modelica.Blocks.Logical.OnOffController onOffController(bandwidth=12)
        annotation (Placement(transformation(extent={{62,-142},{42,-122}})));
      Modelica.Blocks.Sources.Constant T_switch(k=273.105 + 48)
        annotation (Placement(transformation(extent={{148,-136},{128,-116}})));
      Modelica.Blocks.Math.BooleanToReal booleanToInteger
        annotation (Placement(transformation(extent={{30,-142},{10,-122}})));
      Modelica.Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-8,-8},{8,8}},
            rotation=90,
            origin={4,-74})));
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
        annotation (Placement(transformation(extent={{-78,-98},{-60,-80}})));
      Modelica.Blocks.Sources.Constant TDryBul(k=T_DB)
        annotation (Placement(transformation(extent={{146,68},{126,88}})));
      Modelica.Blocks.Sources.Constant TRadMea(k=TMeaRad)
        annotation (Placement(transformation(extent={{146,30},{126,50}})));
      Modelica.Blocks.Sources.Constant TFloor(k=T_Floor)
        annotation (Placement(transformation(extent={{-128,-18},{-108,2}})));
      Modelica.Blocks.Sources.Constant QPilot(k=158) annotation (Placement(
            transformation(extent={{146,-42},{126,-62}}, rotation=0)));
      Modelica.Blocks.Math.Add add annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={12,-36})));
      BaseClasses.Burner.Gas burn(
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
        annotation (Placement(transformation(extent={{-18,0},{40,42}})));
      WaterHeaterLib.WaterHeater tan(
        allowFlowReversal=false,
        m_flow_nominal=0.001,
        energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
        massDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
        redeclare package Medium = Medium,
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
        perInA={0,0,0,0,0,1},
        perInB={0,0,0,0,0,1},
        perInC={0,0,0,0,0,1},
        timDelA={0,0,0,0,0,1},
        timDelB={0,0,0,0,0,1},
        timDelC={0,0,0,0,0,1},
        T_Initial={321.15,321.15,321.15,321.15,321.15,321.15})
        annotation (Placement(transformation(extent={{-46,48},{68,136}})));
      Modelica.Blocks.Tables.CombiTable1Ds WaterFlow[nSeg](
        tableOnFile=true,
        tableName="Flow",
        fileName="26-WaterFlowFromTest8.txt")
        annotation (Placement(transformation(extent={{-106,126},{-86,146}})));
      Modelica.Blocks.Sources.RealExpression Time[nSeg](y=time)
        annotation (Placement(transformation(extent={{-148,126},{-128,146}})));
      WaterHeaterLib.BaseClasses.QEle qEle(QEleIdl=QEleIdl, QEleAct=QEleAct)
                                           annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-28,-72})));
    equation
      connect(T_switch.y,onOffController. reference) annotation (Line(
          points={{127,-126},{64,-126}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(onOffController.y,booleanToInteger. u) annotation (Line(
          points={{41,-132},{32,-132}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(booleanToInteger.y,product. u1) annotation (Line(
          points={{9,-132},{-0.8,-132},{-0.8,-83.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TFloor.y,TBCBot. T) annotation (Line(
          points={{-107,-8},{-82.1,-8},{-82.1,-8},{-57.2,-8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QBurner.y,product. u2) annotation (Line(
          points={{125,-88},{8.8,-88},{8.8,-83.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y,add. u1) annotation (Line(
          points={{4,-65.2},{4,-48},{6,-48}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QPilot.y,add. u2) annotation (Line(
          points={{125,-52},{18,-52},{18,-48}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y,burn. QBurner) annotation (Line(
          points={{12,-25},{12,-2},{22.31,-2},{22.31,5.64828}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TBCBot.port,burn. heaPorBot) annotation (Line(
          points={{-44,-8},{9.26,-8},{9.26,5.50345}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(TDryBul.y,burn. TDryBul) annotation (Line(
          points={{125,78},{80,78},{80,-2},{-2.195,-2},{-2.195,5.50345}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(tan.heaPorBot,burn. heaPorTop) annotation (Line(
          points={{-3.84151,45.8537},{-3.84151,47},{-3.5,47},{-3.5,36.2069}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(tan.Q_B,burn. Q_B) annotation (Line(
          points={{6.48302,45.8537},{6.48302,47},{7.23,47},{7.23,36.3517}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(tan.T_F0_y,burn. T_F0_y) annotation (Line(
          points={{15.7321,46.9268},{15.7321,47.5},{16.365,47.5},{16.365,
              36.2069}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(tan.cdot_G_y,burn. cdot_G_y) annotation (Line(
          points={{24.766,46.9268},{24.766,47.5},{25.355,47.5},{25.355,35.9172}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TDryBul.y,tan. TDryBul) annotation (Line(
          points={{125,78},{80,78},{80,100.371},{34.4453,100.371}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TRadMea.y,tan. TRadMea)  annotation (Line(
          points={{125,40},{80,40},{80,66.4585},{33.8,66.4585}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(tan.heaPor[5],T_sensor. port) annotation (Line(
          points={{34.3377,84.3805},{52,84.3805},{52,-11},{68,-11}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(T_sensor.T,onOffController. u) annotation (Line(
          points={{78,-11},{86,-11},{86,-138},{64,-138}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Time.y,WaterFlow. u)               annotation (Line(
          points={{-127,136},{-108,136}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(WaterFlow.y[1],tan. m_flow_in)     annotation (Line(
          points={{-85,136},{-50.5509,136},{-50.5509,136.429},{-16.1019,136.429}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(booleanToInteger.y, qEle.BurnerStatus) annotation (Line(
          points={{9,-132},{-28,-132},{-28,-84}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-150,-150},
                {150,150}}), graphics), Icon(coordinateSystem(preserveAspectRatio=true,
              extent={{-150,-150},{150,150}})));
    end StorageTankWithFan;

    model SimplifiedStorageTankExample
      "An example of how the SimplifiedStorageTank model is used"
      extends Modelica.Icons.Example;
      package Water = Modelica.Media.Water.WaterIF97_ph "Medium model";

      Real nSeg = 8;
      SimplifiedStorageTank tan(
        RecircOutSeg=8,
        RecircInSeg=1,
        Deadband=3,
        UA=30,
        redeclare package Medium = Water)
               annotation (Placement(transformation(extent={{-52,-12},{54,70}})));
      Modelica.Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-6,-56})));
      Modelica.Blocks.Math.Add add annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-44,-50})));
      Modelica.Blocks.Math.IntegerToReal integerToReal annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={44,-50})));
      Modelica.Blocks.Sources.Constant QDotBurner(k=12000) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={44,-80})));
      Modelica.Blocks.Sources.Constant QDotPilot(k=120) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={4,-30})));
      Modelica.Blocks.Sources.Constant TAmb(k=273.105 + 20)
        annotation (Placement(transformation(extent={{-94,34},{-74,54}})));
      Modelica.Blocks.Sources.Constant mFloRecirc(k=0)
        annotation (Placement(transformation(extent={{-94,6},{-74,26}})));
      Modelica.Blocks.Sources.Constant TInRecirc(k=273.105 + 20)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      Modelica.Blocks.Sources.Constant TIn(k=273.105 + 15) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={30,90})));
      Modelica.Blocks.Tables.CombiTable1Ds DrawFlow[nSeg]
        annotation (Placement(transformation(extent={{-74,74},{-54,94}})));
      Modelica.Blocks.Sources.RealExpression realExpression[nSeg](y=time)
        annotation (Placement(transformation(extent={{-104,74},{-84,94}})));
    equation
      connect(product.y, add.u1) annotation (Line(
          points={{-17,-56},{-32,-56}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integerToReal.y, product.u2) annotation (Line(
          points={{33,-50},{6,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integerToReal.u, tan.TStatSig) annotation (Line(
          points={{56,-50},{68,-50},{68,3.6},{56.6,3.6}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(QDotBurner.y, product.u1) annotation (Line(
          points={{33,-80},{20,-80},{20,-62},{6,-62}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QDotPilot.y, add.u2) annotation (Line(
          points={{-7,-30},{-22,-30},{-22,-44},{-32,-44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, tan.QDotIn) annotation (Line(
          points={{-55,-50},{-100,-50},{-100,60},{-55.8,60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TAmb.y, tan.TAmb) annotation (Line(
          points={{-73,44},{-66,44},{-66,45.9},{-56.1,45.9}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mFloRecirc.y, tan.mFloRec) annotation (Line(
          points={{-73,16},{-68,16},{-68,18},{-54.2,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TInRecirc.y, tan.TInRec) annotation (Line(
          points={{-73,-12},{-66,-12},{-66,4.8},{-54.4,4.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TIn.y, tan.TIn) annotation (Line(
          points={{19,90},{10,90},{10,72.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(tan.m_flow_in, DrawFlow.y[1]) annotation (Line(
          points={{-24.2,70.4},{-40,70.4},{-40,84},{-53,84}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression.y, DrawFlow.u) annotation (Line(
          points={{-83,84},{-76,84}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(graphics));
    end SimplifiedStorageTankExample;
  end Examples;

  package BaseClasses
    model buo "flue gas flow rate times capacity"
      import WaterHeaterLib;
      extends Modelica.Blocks.Interfaces.BlockIcon;
      import Buildings;
      parameter Real c_w=1 "standard correlation for natural convection";
      parameter Real A=1 "area surface";
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
        "Medium in the component" annotation (choicesAllMatching=true);

      WaterHeaterLib.BaseClasses.SISO
                  Q_Wx annotation (Placement(transformation(
            extent={{13,-13},{-13,13}},
            rotation=0,
            origin={33,25})));
      Modelica.Blocks.Math.Gain gain1(k=-1) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={72,60})));
      WaterHeaterLib.BaseClasses.TH
          t_H(A=A, c_w=c_w)
        "Calculates the temperature of water flow caused by buoyancy"
        annotation (Placement(transformation(extent={{0,-8},{-36,28}})));
      Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor T_vol_nSeg
        "Temperature of the water"
        annotation (Placement(transformation(extent={{88,16},{66,-6}})));
      WaterHeaterLib.BaseClasses.mFlowBuo   m_flow_buo_x(
        A=A,
        c_w=c_w,
        redeclare package Medium = Medium)
        "Calculates the rate of mass flow caused by buoyancy"
        annotation (Placement(transformation(extent={{-58,-76},{-90,-44}})));
      Modelica.Blocks.Interfaces.RealInput h annotation (Placement(
            transformation(extent={{138,-92},{98,-52}}), iconTransformation(
              extent={{138,-92},{98,-52}})));
      Modelica.Blocks.Interfaces.RealOutput t_h annotation (Placement(
            transformation(extent={{-100,0},{-120,20}}), iconTransformation(
              extent={{-100,-10},{-120,10}})));
      Modelica.Blocks.Interfaces.RealOutput m_flow_buo annotation (Placement(
            transformation(extent={{-100,-70},{-120,-50}}), iconTransformation(
              extent={{-100,-70},{-120,-50}})));
      Modelica.Blocks.Interfaces.RealInput Q_flow
        annotation (Placement(transformation(extent={{140,40},{100,80}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a T_vol
        "Heat port tank bottom (outside insulation). Leave unconnected for adiabatic condition"
        annotation (Placement(transformation(extent={{92,-10},{122,20}},
              rotation=0), iconTransformation(extent={{102,-24},{142,16}})));
      Modelica.Blocks.Interfaces.RealOutput Q_W annotation (Placement(
            transformation(extent={{-100,50},{-120,70}}),iconTransformation(
              extent={{-100,58},{-120,78}})));
    equation

      connect(T_vol_nSeg.T, t_H.T) annotation (Line(
          points={{66,5},{18,5},{18,13.6},{3.6,13.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Q_Wx.y, t_H.Q_flow) annotation (Line(
          points={{18.7,25},{13.35,25},{13.35,24.4},{3.6,24.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(h, t_H.h) annotation (Line(
          points={{118,-72},{54,-72},{54,-0.8},{3.6,-0.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(t_H.y, t_h) annotation (Line(
          points={{-37.8,10},{-110,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Q_flow, gain1.u) annotation (Line(
          points={{120,60},{84,60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T_vol_nSeg.port, T_vol) annotation (Line(
          points={{88,5},{107,5}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(Q_Wx.y, Q_W) annotation (Line(
          points={{18.7,25},{13.35,25},{13.35,60},{-110,60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(m_flow_buo, m_flow_buo_x.y) annotation (Line(
          points={{-110,-60},{-91.6,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gain1.y, Q_Wx.u) annotation (Line(
          points={{61,60},{56,60},{56,25},{48.6,25}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Q_Wx.y, m_flow_buo_x.QDotFlu) annotation (Line(
          points={{18.7,25},{14,25},{14,-60},{-54.8,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(T_vol_nSeg.T, m_flow_buo_x.TWat) annotation (Line(
          points={{66,5},{46,5},{46,6},{20,6},{20,-72.8},{-54.8,-72.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(t_H.y, m_flow_buo_x.T_H) annotation (Line(
          points={{-37.8,10},{-46,10},{-46,-47.2},{-54.8,-47.2}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(graphics), Icon(graphics));
    end buo;

    model cdotG "flue gas flow rate times capacity"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      import Buildings;

      Modelica.Blocks.Interfaces.RealOutput y
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Interfaces.RealInput T_AD(start=303.15)
        annotation (Placement(transformation(extent={{-142,-20},{-102,20}})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{-36,-24},{-16,-4}})));

      Modelica.Blocks.Interfaces.RealInput QIn(start=1000) annotation (
          Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-120})));
      Modelica.Blocks.Interfaces.RealInput TDryBul annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-60,-120})));
      Modelica.Blocks.Math.Division division
        annotation (Placement(transformation(extent={{14,-22},{34,-2}})));
      Modelica.Blocks.Math.Add add1(k2=1)
        annotation (Placement(transformation(extent={{68,-48},{88,-28}})));
      Modelica.Blocks.Sources.Constant guard(k=1e-6)
        annotation (Placement(transformation(extent={{16,-72},{36,-52}})));
    equation

      connect(T_AD, add.u1) annotation (Line(
          points={{-122,0},{-84,0},{-84,-8},{-38,-8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TDryBul, add.u2) annotation (Line(
          points={{-60,-120},{-60,-20},{-38,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, division.u2) annotation (Line(
          points={{-15,-14},{2,-14},{2,-18},{12,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QIn, division.u1) annotation (Line(
          points={{0,-120},{0,-6},{12,-6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(division.y, add1.u1) annotation (Line(
          points={{35,-12},{58,-12},{58,-32},{66,-32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(guard.y, add1.u2) annotation (Line(
          points={{37,-62},{64,-62},{64,-44},{66,-44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.y, y) annotation (Line(
          points={{89,-38},{90,-38},{90,0},{110,0}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(graphics));
    end cdotG;

    model hCB "Convective heat transfer coefficient"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      import Buildings;
      import Modelica.Constants;

      parameter Modelica.SIunits.SpecificHeatCapacity cp_G=4186*0.28
        "mean specific heat of flue gas";
      parameter Modelica.SIunits.Length DT=1 "diameter of the tank";
      parameter Modelica.SIunits.Length DF=0.5 "diameter of the flue";
      parameter Modelica.SIunits.Length DM=0.5*(DT + DF);
      parameter Modelica.SIunits.Length Xn=0.5*(DT - DF);
      parameter Modelica.SIunits.Angle alphaF=6*Constants.pi/180
        "flame spreading angle = 6 degree see page 15 heater manual";
      parameter Modelica.SIunits.DynamicViscosity muF_G=0.120*4.133789E-4;
      parameter Modelica.SIunits.ThermalConductivity k_g=0.045*1.7307
        "flue gas thermal conductivity";
      Modelica.SIunits.MassFlowRate mdot_G;
      Modelica.Blocks.Interfaces.RealOutput y
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Interfaces.RealInput C_dotG
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
    algorithm
      mdot_G := C_dotG/cp_G;
    equation
      y = k_g*0.51*(((mdot_G/(Constants.pi*DM*2*Modelica.Math.tan(alphaF/2)))*
        Xn/muF_G)^(0.62))/Xn;
      annotation (Diagram(graphics));
    end hCB;

    block hRB "Single Input Single Output continuous control block"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      import Modelica.Constants;

      Modelica.Blocks.Interfaces.RealInput T_AD "flame temperature" annotation (
         Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-120})));
      Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
              rotation=0)));
      parameter Real absIR_tan=0.9 "emissivity of tank bottom";
      parameter Real absIR_flame=0.9 "emissivity of flame";

      Modelica.Blocks.Interfaces.RealInput T_WL "tank temperature at bottom"
        annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=-90,
            origin={0,120})));
    equation
      y = ((T_AD^3*absIR_flame*(1 + absIR_tan)*0.5)*Modelica.Constants.sigma)*(
        1 + T_WL/T_AD) annotation (Documentation(info="<html>
<p>
Block has one continuous Real input and one continuous Real output signal.
</p>
</html>"));

      annotation (Diagram(graphics));
    end hRB;

    model InteriorWH
      "Model for a interior (room-side) convective heat transfer for water heater modelling"
      extends Buildings.HeatTransfer.Convection.BaseClasses.PartialConvection;

      parameter Buildings.HeatTransfer.Types.InteriorConvection conMod=
          Buildings.HeatTransfer.Types.InteriorConvection.Fixed
        "Convective heat transfer model" annotation (Evaluate=true);

    public
      Modelica.Blocks.Interfaces.RealInput u annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-120})));
    equation
      if (conMod == Buildings.HeatTransfer.Types.InteriorConvection.Fixed) then
        q_flow = hFixed*dT;
      else
        // Even if hCon is a step function with a step at zero,
        // the product hCon*dT is differentiable at zero with
        // a continuous first derivative
        q_flow = u*dT;

      end if;

      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}),graphics),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-90,80},{-60,-80}},
              lineColor={0,0,0},
              fillColor={192,192,192},
              fillPattern=FillPattern.Backward),
            Line(points={{100,0},{100,0}}, color={0,127,255}),
            Line(points={{100,0},{100,0}}, color={0,127,255}),
            Line(points={{100,0},{100,0}}, color={0,127,255}),
            Text(
              extent={{-35,42},{-5,20}},
              lineColor={255,0,0},
              textString="Q_flow"),
            Line(points={{-60,20},{76,20}}, color={191,0,0}),
            Line(points={{-60,-20},{76,-20}}, color={191,0,0}),
            Line(points={{-34,80},{-34,-80}}, color={0,127,255}),
            Line(points={{6,80},{6,-80}}, color={0,127,255}),
            Line(points={{40,80},{40,-80}}, color={0,127,255}),
            Line(points={{76,80},{76,-80}}, color={0,127,255}),
            Line(points={{-34,-80},{-44,-60}}, color={0,127,255}),
            Line(points={{-34,-80},{-24,-60}}, color={0,127,255}),
            Line(points={{6,-80},{-4,-60}}, color={0,127,255}),
            Line(points={{6,-80},{16,-60}}, color={0,127,255}),
            Line(points={{40,-80},{30,-60}}, color={0,127,255}),
            Line(points={{40,-80},{50,-60}}, color={0,127,255}),
            Line(points={{76,-80},{66,-60}}, color={0,127,255}),
            Line(points={{76,-80},{86,-60}}, color={0,127,255}),
            Line(points={{56,-30},{76,-20}}, color={191,0,0}),
            Line(points={{56,-10},{76,-20}}, color={191,0,0}),
            Line(points={{56,10},{76,20}}, color={191,0,0}),
            Line(points={{56,30},{76,20}}, color={191,0,0})}),
        defaultComponentName="con",
        Documentation(info="<html>
This is a model for a convective heat transfer for interior, room-facing surfaces.
The parameter <code>conMod</code> determines the model that is used to compute
the heat transfer coefficient:
</p>
<p>
<ol>
<li><p>If <code>conMod=<a href=\"modelica://Buildings.HeatTransfer.Types.InteriorConvection\">
Buildings.HeatTransfer.Types.InteriorConvection.Fixed</a></code>, then
the convective heat transfer coefficient is set to the value specified by the parameter
<code>hFixed</code>.
</p>
</li>
</li>
<p>
If <code>conMod=<a href=\"modelica://Buildings.HeatTransfer.Types.InteriorConvection\">
Buildings.HeatTransfer.Types.InteriorConvection.Temperature</a></code>, then
the convective heat tranfer coefficient is a function of the temperature difference.
The convective heat flux is computed using
</p>
<ol>
<li>
for floors the function 
<a href=\"modelica://Buildings.HeatTransfer.Convection.Functions.ConvectiveHeatFlux.floor\">
Buildings.HeatTransfer.Functions.Convection.ConvectiveHeatFlux.floor</a>
</li>
<li>
for ceilings the function
<a href=\"modelica://Buildings.HeatTransfer.Functions.Convection.ConvectiveHeatFlux.ceiling\">
Buildings.HeatTransfer.Functions.Convection.ConvectiveHeatFlux.ceiling</a>
</li>
<li>
for walls the function
<a href=\"modelica://Buildings.HeatTransfer.Functions.Convection.ConvectiveHeatFlux.wall\">
Buildings.HeatTransfer.Functions.Convection.ConvectiveHeatFlux.wall</a>
</li>
</ol>
</li>
</html>", revisions="<html>
<ul>
<li>
April 2, 2011 by Michael Wetter:<br>
Added <code>homotopy</code> operator.
</li>
<li>
March 10 2010, by Michael Wetter:<br>
First implementation.
</li>
</ul>
</html>"));
    end InteriorWH;

    model LongWaveRadiationExchange
      "Radiative heat exchange between two surfaces"
      import Buildings;
      extends Buildings.BaseClasses.BaseIcon;
      //parameter Integer n(min=1) "Number of constructions";
      parameter Modelica.SIunits.Area A "Area of exterior constructions";
      //parameter Modelica.SIunits.Emissivity absIR
      //"Infrared absorptivity of building surface";
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port "Heat port"
        annotation (Placement(transformation(extent={{94,-8},{114,12}})));

      Modelica.Blocks.Interfaces.RealInput u
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
      Modelica.Blocks.Interfaces.RealInput T_In annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=-90,
            origin={0,120})));
    equation
      port.Q_flow = u*A*Modelica.Constants.sigma*(port.T^4 - T_In^4);

      annotation (
        Diagram(graphics),
        Icon(graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-60,80},{-40,-60}},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Rectangle(
              extent={{88,-60},{-74,-74}},
              fillColor={5,135,13},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None,
              lineColor={0,0,0}),
            Ellipse(
              extent={{2,82},{86,36}},
              pattern=LinePattern.None,
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Line(
              points={{-40,16},{-30,28},{-14,28},{-6,44},{10,42},{12,46}},
              smooth=Smooth.None,
              color={255,0,0},
              thickness=0.5),
            Line(
              points={{-40,16},{-22,-4},{2,-6},{12,-30},{42,-40},{48,-58}},
              smooth=Smooth.None,
              color={255,0,0},
              thickness=0.5),
            Text(
              extent={{-128,12},{-78,-34}},
              lineColor={0,0,127},
              textString="TOut"),
            Text(
              extent={{-130,96},{-80,50}},
              lineColor={0,0,127},
              textString="TSky"),
            Text(
              extent={{86,52},{136,6}},
              lineColor={0,0,127},
              textString="QIR_flow")}),
        Documentation(info="<html>
This model computes the infrared radiative heat flow 
between exterior building surfaces and the ambient. The ambient consists
of the sky black-body radiation and the outdoor temperature 
(which is used as an approximation to the surface temperature of
the ground and neighboring buildings).
</html>", revisions="<html>
<ul>
<li>
June 4 2010, by Michael Wetter:<br>
First implementation.
</li>
</ul>
</html>"));
    end LongWaveRadiationExchange;

    model mFlowBuo "mass flow rate induced buoyancy"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      import Buildings;

      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
        "Medium in the component" annotation (choicesAllMatching=true);
      parameter Real c_w=1 "standard correlation for natural convection";
      parameter Real A "area";
      // Get the specific heat capacity of MediumB.
      Medium.SpecificHeatCapacity c_p=Medium.specificHeatCapacityCp(
          Medium.setState_pTX(
              Medium.p_default,
              Medium.T_default,
              Medium.X_default));
      Modelica.Blocks.Interfaces.RealOutput y
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Interfaces.RealInput QDotFlu
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
      Modelica.Blocks.Interfaces.RealInput T_H
        annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
      Modelica.Blocks.Interfaces.RealInput TWat
        annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
    algorithm

      if QDotFlu > 5 then
        y := QDotFlu / (c_p*(T_H - TWat));
      else
        y:= 0;
      end if;
      annotation (Diagram(graphics));
    end mFlowBuo;

    model SISO "single input, single output"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      import Buildings;

      Modelica.Blocks.Interfaces.RealOutput y
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));

      Modelica.Blocks.Interfaces.RealInput u annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-120,0})));
    equation
      y = u;

      annotation (Diagram(graphics), Icon(graphics));
    end SISO;

    model TFlame "Calculate the adiabatic flame temperature"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      import Buildings;
      import Modelica.SIunits;

      parameter Modelica.SIunits.SpecificEnergy deltaHc_H=22000*2e3
        "fuel calorific value at higher heating value";
      parameter Real cp_G=1170 "mean specific heat capacity of flue gas";
      parameter Modelica.SIunits.StoichiometricNumber stoich=16
        "stoichchiometric air/fuel ratio";
      parameter Real EA=0.5 "excess air ratio";

      Modelica.Blocks.Sources.Constant const(k=(deltaHc_H/cp_G)/((1 + stoich)*(
            1 + EA)))
        annotation (Placement(transformation(extent={{-52,62},{-32,82}})));
      Modelica.Blocks.Interfaces.RealOutput y
        annotation (Placement(transformation(extent={{100,20},{120,40}})));
      Modelica.Blocks.Interfaces.RealInput TDryBul
        annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
      Modelica.Blocks.Math.Add add
        annotation (Placement(transformation(extent={{0,20},{20,40}})));
      Modelica.Blocks.Interfaces.RealInput QBurner
        annotation (Placement(transformation(extent={{-140,-40},{-100,0}})));
      Modelica.Blocks.Logical.Switch switch1
        annotation (Placement(transformation(extent={{62,-20},{82,0}})));
      Modelica.Blocks.Logical.Greater greater
        annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
      Modelica.Blocks.Sources.Constant const1(k=0)
        annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
      Modelica.Blocks.Sources.Constant const2(k=273.15)
        annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
    equation

      connect(const.y, add.u1) annotation (Line(
          points={{-31,72},{-20,72},{-20,36},{-2,36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TDryBul, add.u2) annotation (Line(
          points={{-120,60},{-62,60},{-62,24},{-2,24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QBurner, greater.u1) annotation (Line(
          points={{-120,-20},{-68,-20},{-68,-10},{-22,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(const1.y, greater.u2) annotation (Line(
          points={{-59,-50},{-40,-50},{-40,-18},{-22,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(greater.y, switch1.u2) annotation (Line(
          points={{1,-10},{60,-10}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(const2.y, switch1.u3) annotation (Line(
          points={{1,-50},{24,-50},{24,-18},{60,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, switch1.u1) annotation (Line(
          points={{21,30},{34,30},{34,-2},{60,-2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, y) annotation (Line(
          points={{21,30},{110,30}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}})));
    end TFlame;

    model TF0 "flue entrance temperature"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      import Buildings;

      parameter Real deltaHc_L=20000*2e3
        "fuel calorific value at lower heating value";
      parameter Real deltaHc_H=22000*2e3
        "fuel calorific value at higher heating value";

      Modelica.Blocks.Interfaces.RealOutput y
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Interfaces.RealInput C_dot_G(start=1) annotation (
          Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={40,-120})));
      Modelica.Blocks.Interfaces.RealInput QIn annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-62,-120})));
      Modelica.Blocks.Math.Add add(k2=+1)
        annotation (Placement(transformation(extent={{-6,-14},{14,6}})));
      Modelica.Blocks.Math.Gain gain1(k=deltaHc_L/deltaHc_H)
        annotation (Placement(transformation(extent={{-44,-8},{-24,12}})));
      Modelica.Blocks.Math.Gain gain2(k=1/1.06)
        annotation (Placement(transformation(extent={{-48,-52},{-28,-32}})));
      Modelica.Blocks.Math.Add add1(k2=+1)
        annotation (Placement(transformation(extent={{66,-4},{86,16}})));
      Modelica.Blocks.Math.Division division
        annotation (Placement(transformation(extent={{28,-22},{48,-2}})));
      Modelica.Blocks.Interfaces.RealInput TDryBul annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-120,0})));
      Modelica.Blocks.Interfaces.RealInput QLoss(start=1) annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-12,-120})));
    equation

      connect(gain1.y, add.u1) annotation (Line(
          points={{-23,2},{-8,2}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(gain2.y, division.u2) annotation (Line(
          points={{-27,-42},{22,-42},{22,-18},{26,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(division.y, add1.u2) annotation (Line(
          points={{49,-12},{50,-12},{50,0},{64,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QIn, gain1.u) annotation (Line(
          points={{-62,-120},{-62,2},{-46,2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, division.u1) annotation (Line(
          points={{15,-4},{22,-4},{22,-6},{26,-6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.y, y) annotation (Line(
          points={{87,6},{94,6},{94,0},{110,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gain2.u, C_dot_G) annotation (Line(
          points={{-50,-42},{-54,-42},{-54,-88},{40,-88},{40,-120}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(TDryBul, add1.u1) annotation (Line(
          points={{-120,0},{-78,0},{-78,36},{30,36},{30,12},{64,12}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(QLoss, add.u2) annotation (Line(
          points={{-12,-120},{-12,-10},{-8,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(graphics), Icon(graphics));
    end TF0;

    model TH "Temeprature flue stream"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      import Buildings;

      parameter Real c_w=1 "standard correlation for natural convection";
      parameter Real A "area";

      Modelica.Blocks.Interfaces.RealOutput y
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Interfaces.RealInput T
        annotation (Placement(transformation(extent={{-140,0},{-100,40}})));
      Modelica.Blocks.Interfaces.RealInput h
        annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
      Modelica.Blocks.Interfaces.RealInput Q_flow
        annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
    algorithm
      y := T + c_w*Q_flow/(h*A) annotation (Diagram(graphics));
      annotation (Diagram(graphics));
    end TH;

    model THotGas "Hot gas temperature"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      import Buildings;

      Real Ntu_B;
      parameter Real A_B=1 "Area of the base of the tank";

      Modelica.Blocks.Interfaces.RealOutput y
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Interfaces.RealInput T_WL
        annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
      Modelica.Blocks.Interfaces.RealInput T_AD
        annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
      Modelica.Blocks.Interfaces.RealInput h_RB
        annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
      Modelica.Blocks.Interfaces.RealInput h_CB
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
      Modelica.Blocks.Interfaces.RealInput C_dotG
        annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
    equation
      Ntu_B = ((h_RB + h_CB)*A_B)/C_dotG;
      y = (T_AD + Ntu_B*T_WL)/(1 + Ntu_B);
      annotation (Diagram(graphics));
    end THotGas;

    model buoHeaTra
      "Calculates the heat transfer between segments in the heater caused by buoyant flow"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;

      parameter Integer nSeg(min=2) = 2;

      parameter Real QDotPilot;

      Modelica.Blocks.Interfaces.RealInput QDotBas
        annotation (Placement(transformation(extent={{-140,-120},{-100,-80}})));
      Modelica.Blocks.Interfaces.RealInput QDotFlu[nSeg]
        annotation (Placement(transformation(extent={{-140,-40},{-100,0}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a TWat[nSeg]
        annotation (Placement(transformation(extent={{-116,26},{-96,46}})));
      Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor WatT[nSeg]
        annotation (Placement(transformation(extent={{-96,26},{-76,46}})));
      Modelica.Blocks.Interfaces.RealOutput buoHeaTra[nSeg]
        annotation (Placement(transformation(extent={{100,-6},{132,26}})));
      WaterHeaterLib.BaseClasses.strLay
            strLay(nSeg=nSeg, QDotPilot=QDotPilot)
                              annotation (Placement(transformation(extent={{-66,26},
                {-46,46}})));
      heaSum heaSum1(nSeg=nSeg)
        annotation (Placement(transformation(extent={{-36,-14},{-16,6}})));
      QIn qIn(nSeg=nSeg)
              annotation (Placement(transformation(extent={{20,-54},{40,-34}})));
      Modelica.Blocks.Interfaces.RealInput QLosTop
        annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
    equation

      connect(TWat, WatT.port) annotation (Line(
          points={{-106,36},{-96,36}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(WatT.T, strLay.TWat) annotation (Line(
          points={{-76,36},{-68,36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(strLay.strLay, heaSum1.strLay) annotation (Line(
          points={{-44.4,36},{-42,36},{-42,0},{-38,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QDotFlu, heaSum1.QDotFlu) annotation (Line(
          points={{-120,-20},{-80,-20},{-80,-8},{-38,-8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QDotBas, heaSum1.QDotBas) annotation (Line(
          points={{-120,-100},{-60,-100},{-60,-14},{-38,-14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(strLay.strLay, qIn.strLay) annotation (Line(
          points={{-44.4,36},{0,36},{0,-38},{18,-38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heaSum1.QBelStrTot, qIn.heaBelStrTot) annotation (Line(
          points={{-15,-4},{-8,-4},{-8,-42},{18,-42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QDotFlu, qIn.QDotFlu) annotation (Line(
          points={{-120,-20},{-20,-20},{-20,-50},{18,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QDotBas, qIn.QDotBas) annotation (Line(
          points={{-120,-100},{-20,-100},{-20,-54},{18,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(qIn.QInCom, buoHeaTra) annotation (Line(
          points={{41,-44},{78,-44},{78,10},{116,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(WatT.T, qIn.TWat) annotation (Line(
          points={{-76,36},{-76,-46},{18,-46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QLosTop, heaSum1.QLosTop) annotation (Line(
          points={{-120,80},{-38,80},{-38,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QLosTop, qIn.QLosTop) annotation (Line(
          points={{-120,80},{4,80},{4,-34},{18,-34}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}),
                          graphics), Icon(coordinateSystem(preserveAspectRatio=true,
              extent={{-100,-100},{100,100}})));
    end buoHeaTra;

    model buoMas
      "Identifies mass flow rates in each segment caused by buoyancy (flows caused by both base and flue heat transfer)"
      extends Modelica.Blocks.Interfaces.BlockIcon;

      parameter Integer nSeg(min=2) = 2;

      Real m_flow_BU[nSeg];
      Real mFloInFlu[nSeg];
      Real mFloInFluSeg[nSeg];
      Real smoDel = 0.00001;
      Real deadband = 0.01;

      Modelica.Blocks.Interfaces.RealInput mFloOutBas
        annotation (Placement(transformation(extent={{-140,80},{-100,120}})));
       Modelica.Blocks.Interfaces.RealInput mFloOutFlu[nSeg]
         annotation (Placement(transformation(extent={{-140,-40},{-100,0}})));
      Modelica.Blocks.Interfaces.RealInput THotOutBas
        annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
       Modelica.Blocks.Interfaces.RealInput THotOutFlu[nSeg]
         annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
      Modelica.Blocks.Interfaces.RealOutput mFloIn[nSeg]
        annotation (Placement(transformation(extent={{100,10},{120,30}})));
      Modelica.Blocks.Interfaces.RealInput TWat[nSeg]
        annotation (Placement(transformation(extent={{-140,0},{-100,40}})));
    algorithm
        //  total buoyancy flow from lower zones which mixes into zone i, see Eqn 7. page 8 of water heater manual
      for i in 2:(nSeg-1) loop
          m_flow_BU[i] :=  mFloOutBas * Buildings.Utilities.Math.Functions.smoothHeaviside(THotOutBas - TWat[i] - deadband,smoDel) * Buildings.Utilities.Math.Functions.smoothHeaviside(TWat[i-1] - THotOutBas,smoDel);

         for j in i:nSeg loop
             mFloInFluSeg[j] :=  mFloOutFlu[j] * Buildings.Utilities.Math.Functions.smoothHeaviside(THotOutFlu[j] - TWat[i] - deadband,smoDel) * Buildings.Utilities.Math.Functions.smoothHeaviside(TWat[i-1] - THotOutFlu[j],smoDel);
         end for;

         mFloInFlu[i] :=  sum(mFloInFluSeg[i:nSeg]);
         mFloIn[i] :=  m_flow_BU[i] + mFloInFlu[i];

      end for;

      //  total buoyancy flow from lower zones which mixes into zone nSeg, see Eqn 7. page 8 of water heater manual
         m_flow_BU[1] :=mFloOutBas * Buildings.Utilities.Math.Functions.smoothHeaviside(THotOutBas - TWat[1] - deadband,smoDel);

        for j in 1:nSeg loop
            mFloInFluSeg[j] :=  mFloOutFlu[j] * Buildings.Utilities.Math.Functions.smoothHeaviside(THotOutFlu[j] - TWat[1] - deadband,smoDel);
        end for;

        mFloInFlu[1] :=  sum(mFloInFluSeg[1:nSeg]);
        mFloIn[1] :=  m_flow_BU[1] + mFloInFlu[1];

        m_flow_BU[nSeg] := mFloOutBas * Buildings.Utilities.Math.Functions.smoothHeaviside(TWat[nSeg - 1] - THotOutBas,smoDel);

        mFloInFlu[nSeg] := mFloOutFlu[nSeg] * Buildings.Utilities.Math.Functions.smoothHeaviside(TWat[nSeg - 1] - THotOutFlu[nSeg],smoDel);

        mFloIn[nSeg] := m_flow_BU[nSeg] + mFloInFlu[nSeg];

      annotation (Diagram(graphics));
    end buoMas;

    model mDCal
      "Calculate the fownward mass flow rates which balance the buoyancy flow rates (mdot_D)"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      parameter Integer nSeg(min=2)=2;
      Modelica.Blocks.Interfaces.RealInput mDotBas
        annotation (Placement(transformation(extent={{-140,70},{-100,110}})));
      Modelica.Blocks.Interfaces.RealInput mDotIn[nSeg]
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
      Modelica.Blocks.Interfaces.RealInput mDotFlu[nSeg]
        annotation (Placement(transformation(extent={{-140,-110},{-100,-70}})));
      Modelica.Blocks.Interfaces.RealOutput mDotD[nSeg]
        annotation (Placement(transformation(extent={{100,-20},{140,20}})));
    equation

    mDotD[1] = mDotIn[1] - mDotFlu[1];
    mDotD[nSeg] = 0;
    for i in 2:(nSeg-1) loop
      0 = mDotIn[i] - mDotFlu[i] + mDotD[i-1] - mDotD[i];
    end for;

      annotation (Diagram(graphics));
    end mDCal;

    model QBuo "Calculates the heat transfer rate caused by buoyancy"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;

      Medium.SpecificHeatCapacity c_p=Medium.specificHeatCapacityCp(
        Medium.setState_pTX(
          Medium.p_default,
          Medium.T_default,
          Medium.X_default));

      parameter Integer nSeg(min=2)=2;

      Modelica.Blocks.Interfaces.RealInput TWat[nSeg]
        annotation (Placement(transformation(extent={{-140,-40},{-100,0}})));

      Modelica.Blocks.Interfaces.RealInput mDotD[nSeg]
        annotation (Placement(transformation(extent={{-140,0},{-100,40}})));
      Modelica.Blocks.Interfaces.RealInput dHBU[nSeg]
        annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
      Modelica.Blocks.Interfaces.RealOutput buoHeaTra[nSeg]
        annotation (Placement(transformation(extent={{100,-18},{136,18}})));

      Modelica.Blocks.Interfaces.RealInput QBas
        annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
      Modelica.Blocks.Interfaces.RealInput QFlu[nSeg]
        annotation (Placement(transformation(extent={{-140,-120},{-100,-80}})));
      Modelica.Blocks.Interfaces.RealInput mDotC[nSeg]
        annotation (Placement(transformation(extent={{-140,80},{-100,120}})));
    equation
      for i in 2:(nSeg - 1) loop
        buoHeaTra[i] =  dHBU[i] + c_p*mDotD[i - 1]*(TWat[i - 1] - TWat[i]) + c_p*mDotC[i]*(TWat[i - 1] - TWat[i]) - c_p*mDotC[i]*(TWat[i] - TWat[i + 1]) + QFlu[i] - c_p * mDotD[i] * (TWat[i] - TWat[i+1]);
      end for;

      // calculate total heat flux for zone 1 that will be added to port for energy balance calculation, see Eqn 10. page 8 of water heater manual
      buoHeaTra[1] =  dHBU[1] - c_p*mDotC[1]*(TWat[1] - TWat[2]) + QFlu[1] - c_p * mDotD[1] * (TWat[1] - TWat[2]);

      // calculate total heat flux for zone nSeg that will be added to port for energy balance calculation, see Eqn 10. page 8 of water heater manual
      buoHeaTra[nSeg] =  dHBU[nSeg] + c_p*mDotC[nSeg]*(TWat[nSeg-1] - TWat[nSeg]) + mDotD[nSeg-1] * c_p * (TWat[nSeg-1] - TWat[nSeg]) + QFlu[nSeg] + QBas;

      annotation (Diagram(graphics));
    end QBuo;

    model dHBU
      extends Modelica.Blocks.Interfaces.BlockIcon;
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;

      Medium.SpecificHeatCapacity c_p=Medium.specificHeatCapacityCp(
        Medium.setState_pTX(
          Medium.p_default,
          Medium.T_default,
          Medium.X_default));

      parameter Integer nSeg(min=2)=2;
      Real smoDel = 0.00001;
      Real dH_BU_B[nSeg];
      Real dH_BU_F[nSeg];
      Real dH_BU_F_Seg[nSeg];
      Real deadband = 0.01;
      Modelica.Blocks.Interfaces.RealOutput dH_BU[nSeg]
        annotation (Placement(transformation(extent={{100,-2},{120,18}})));
      Modelica.Blocks.Interfaces.RealInput mDotBas
        annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
      Modelica.Blocks.Interfaces.RealInput THotBas
        annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
      Modelica.Blocks.Interfaces.RealInput TWat[nSeg]
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
      Modelica.Blocks.Interfaces.RealInput mDotFlu[nSeg]
        annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
      Modelica.Blocks.Interfaces.RealInput THotFlu[nSeg]
        annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
    algorithm
      dH_BU_B[1] :=mDotBas*c_p*(THotBas - TWat[1])*
        Buildings.Utilities.Math.Functions.smoothHeaviside(THotBas - TWat[1],smoDel);

        for j in 1:nSeg loop
            dH_BU_F_Seg[j] :=mDotFlu[j]*c_p*(THotFlu[j] - TWat[1])*Buildings.Utilities.Math.Functions.smoothHeaviside(THotFlu[j] - TWat[1]-deadband, smoDel);
        end for;
        dH_BU_F[1] :=sum(dH_BU_F_Seg[1:nSeg]);
        dH_BU[1] :=dH_BU_B[1] + dH_BU_F[1];

      // heat enthalpy of zone i, see Eqn 11. page 8 of water heater manual
      for i in 2:(nSeg - 1) loop
          dH_BU_B[i] :=mDotBas*c_p*(THotBas - TWat[i])*Buildings.Utilities.Math.Functions.smoothHeaviside(THotBas - TWat[i]-deadband,smoDel)*Buildings.Utilities.Math.Functions.smoothHeaviside(TWat[i - 1]
           - THotBas, smoDel);

        for j in i:nSeg loop
            dH_BU_F_Seg[j] :=mDotFlu[j]*c_p*(THotFlu[j] - TWat[i])*Buildings.Utilities.Math.Functions.smoothHeaviside(THotFlu[j] - TWat[i]-deadband, smoDel)*Buildings.Utilities.Math.Functions.smoothHeaviside(TWat[i - 1] - THotFlu[j], smoDel);
        end for;
        dH_BU_F[i] :=sum(dH_BU_F_Seg[i:nSeg]);
        dH_BU[i] :=dH_BU_B[i] + dH_BU_F[i];
      end for;

      // heat enthalpy of zone nSeg, see Eqn 11. page 8 of water heater manual
        dH_BU_B[nSeg] :=mDotBas*c_p*(THotBas - TWat[nSeg])*Buildings.Utilities.Math.Functions.smoothHeaviside(TWat[nSeg - 1] -THotBas, smoDel);

        dH_BU_F[nSeg] :=mDotFlu[nSeg]*c_p*(THotFlu[nSeg] - TWat[nSeg])*Buildings.Utilities.Math.Functions.smoothHeaviside(TWat[nSeg - 1] -THotFlu[nSeg], smoDel);
        dH_BU[nSeg] :=dH_BU_B[nSeg] + dH_BU_F[nSeg];

      annotation (Diagram(graphics));
    end dHBU;

    model draHeaTra
      "Calculates the heat transfer rates caused by a hot water draw event"
      extends Modelica.Blocks.Interfaces.BlockIcon;
       replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;

       Medium.SpecificHeatCapacity c_p=Medium.specificHeatCapacityCp(
         Medium.setState_pTX(
           Medium.p_default,
           Medium.T_default,
           Medium.X_default));

    //  parameter Real TIn = 273.15 + 15;
      parameter Integer nSeg(min=2) = 8;
    //   parameter Real topMix = 15;
    //   parameter Real mDotMix = 0.3;
    //   Real smoDel = 0.0001;
    //   Real mixZon[nSeg];

    //  Integer TotalSegs;

      Real SumBelow[nSeg];
      Real TotalFlow;
      Real small = 0.0001;
      parameter Real perInA[nSeg];
      parameter Real perInB[nSeg];
      parameter Real perInC[nSeg];
      parameter Real timDelA[nSeg];
      parameter Real timDelB[nSeg];
      parameter Real timDelC[nSeg];

      Modelica.Blocks.Interfaces.RealInput mFloIn[nSeg]
        annotation (Placement(transformation(extent={{-140,-70},{-100,-30}})));
      Modelica.Blocks.Logical.Timer timer[nSeg]
        annotation (Placement(transformation(extent={{-4,-60},{16,-40}})));
      Modelica.Blocks.Logical.Greater greater[nSeg]
        annotation (Placement(transformation(extent={{-38,-60},{-18,-40}})));
      Modelica.Blocks.Sources.Constant const[nSeg](k=0.00001)
        annotation (Placement(transformation(extent={{-74,-76},{-54,-56}})));
      timDel timDel1(
        nSeg=nSeg,
        timDelA=timDelA,
        timDelB=timDelB,
        timDelC=timDelC)
        annotation (Placement(transformation(extent={{-36,-100},{-16,-80}})));
      Modelica.Blocks.Logical.Greater greater1[nSeg]
        annotation (Placement(transformation(extent={{30,-60},{50,-40}})));
      Modelica.Blocks.Math.BooleanToInteger booleanToInteger[nSeg]
        annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
      minFloIn minFloIn1(
        nSeg=nSeg,
        perInA=perInA,
        perInB=perInB,
        perInC=perInC)
        annotation (Placement(transformation(extent={{-68,2},{-48,22}})));
      perFloIn perFloIn1(nSeg=nSeg)
        annotation (Placement(transformation(extent={{-28,-4},{-8,16}})));
      Modelica.Blocks.Sources.IntegerExpression integerExpression[nSeg](y=
            booleanToInteger.y)
        annotation (Placement(transformation(extent={{-72,-18},{-52,2}})));
      Modelica.Blocks.Interfaces.RealOutput draHeaTra[nSeg]
        annotation (Placement(transformation(extent={{100,-2},{120,18}})));
      Modelica.Blocks.Interfaces.RealInput TWat[nSeg]
        annotation (Placement(transformation(extent={{-140,52},{-100,92}})));
      Modelica.Blocks.Interfaces.RealInput TIn
        annotation (Placement(transformation(extent={{-140,12},{-100,52}})));
    equation

      TotalFlow = sum(perFloIn1.perFlo[1:nSeg]);

    //  TotalSegs = sum(booleanToInteger.y);
    //  T_F_avg = sum(T_F[1:nSeg])/nSeg;

    // for i in 1:nSeg loop
    //   mixZon[i] = Buildings.Utilities.Math.Functions.smoothHeaviside(i - topMix + smoDel,smoDel);
    // end for;
    //
    // draHeaTra[nSeg] = mixZon[nSeg] * 1/(nSeg-topMix+1) * mFloIn[nSeg] * c_p * (TIn - TWat[nSeg]) +  (1-mixZon[nSeg]) * mFloIn[nSeg] * c_p * (TIn - TWat[nSeg]);
    //
    //   for i in 1:(nSeg-1) loop
    //     draHeaTra[i] = mixZon[i] * 1/(nSeg-topMix+1) * mFloIn[i] * c_p * (TIn - TWat[i]) + mFloIn[i] *c_p* (TWat[i+1] - TWat[i]) + mixZon[i] * mDotMix * c_p * (TWat[i+1] - TWat[i]);
    //   end for;

    for i in (1:nSeg-1) loop
        SumBelow[i] = sum(perFloIn1.perFlo[i:nSeg]) - perFloIn1.perFlo[i];
        draHeaTra[i] = (perFloIn1.perFlo[i] * mFloIn[i] * c_p * (TIn - TWat[i]) + SumBelow[i] * mFloIn[i] * c_p * (TWat[i+1] - TWat[i]))*1/(TotalFlow+small);
    end for;

    SumBelow[nSeg] = 0;
    draHeaTra[nSeg] = perFloIn1.perFlo[nSeg] * mFloIn[nSeg] * c_p * (TIn - TWat[nSeg]);

      connect(mFloIn, greater.u1) annotation (Line(
          points={{-120,-50},{-40,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(greater.y, timer.u) annotation (Line(
          points={{-17,-50},{-6,-50}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(const.y, greater.u2) annotation (Line(
          points={{-53,-66},{-48,-66},{-48,-58},{-40,-58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(timer.y, greater1.u1) annotation (Line(
          points={{17,-50},{28,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(mFloIn, timDel1.m_flow_in) annotation (Line(
          points={{-120,-50},{-84,-50},{-84,-82},{-38,-82}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(timDel1.y, greater1.u2) annotation (Line(
          points={{-15,-88},{20,-88},{20,-58},{28,-58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(greater1.y, booleanToInteger.u) annotation (Line(
          points={{51,-50},{58,-50}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(mFloIn, minFloIn1.m_flow_in) annotation (Line(
          points={{-120,-50},{-84,-50},{-84,20},{-70,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(minFloIn1.y, perFloIn1.minFloIn) annotation (Line(
          points={{-47,14},{-30,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integerExpression.y, perFloIn1.Active) annotation (Line(
          points={{-51,-8},{-40,-8},{-40,2},{-30,2}},
          color={255,127,0},
          smooth=Smooth.None));
      annotation (Diagram(graphics));
    end draHeaTra;

    package Burner

      model Gas "model of a gas burner for water heater"
        import SI = Modelica.SIunits;
        import Modelica.Constants;
        import WaterHeaterLib;
        import Modelica.Fluid.Types;
        import Modelica.Fluid.Types.Dynamics;
        import Modelica.Constants;
        parameter Modelica.SIunits.Length DTan=1 "diameter of the tank";
        parameter Modelica.SIunits.Length DFlu=0.5 "diameter of the flue";
        parameter Buildings.HeatTransfer.Types.InteriorConvection conMod=
            Buildings.HeatTransfer.Types.InteriorConvection.Temperature
          "Convective heat transfer model for opaque constructions"
          annotation (Dialog(group="Convective heat transfer"));

        parameter Modelica.SIunits.CoefficientOfHeatTransfer hFixed=3.0
          "Constant convection coefficient for opaque constructions"
          annotation (Dialog(group="Convective heat transfer", enable=(conMod
                 == Buildings.HeatTransfer.Types.InteriorConvection.Fixed)));
        parameter Real h_GB=3
          "Convection coefficient between the hot gas and the base of the tank";
        Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorBot
          "Heat port tank bottom (outside insulation). Leave unconnected for adiabatic condition"
          annotation (Placement(transformation(extent={{-14,-382},{14,-354}},
                rotation=0), iconTransformation(extent={{16,-304},{56,-264}})));

      public
        parameter Buildings.Rooms.BaseClasses.ParameterConstruction datTanEnvBot(
          each A=0,
          redeclare Buildings.HeatTransfer.Data.OpaqueConstructions.Brick120 layers,
          each til=0,
          each azi=0) "Data for exterior construction" annotation (Placement(
              transformation(extent={{404,170},{442,208}})), HideResult=true);

        parameter Modelica.SIunits.SpecificEnergy deltaHc_H=10000
          "Fuel calorific value (higher heating value) in J/kg";
        parameter Modelica.SIunits.SpecificEnergy deltaHc_L=10
          "Fuel calorific value (lower heating value) in J/kg";

        parameter Real absIR_FS=0.4 "Absorptivity of floor shield -- fixme";
        parameter Real absIR_Fla=0.07 "Absorptivity of flame -- fixme";
        parameter Real fv=0.2 "view factor between flame and shield";
        parameter Real vfb=0.5 "view factor between the flame and the base";
        //parameter Real h_CB=10
        //  "Convective heat transfer coefficient between hot gas and tank bottom (see page 13) --fixme";
        parameter Modelica.SIunits.StoichiometricNumber stoich=16.20
          "stoichometric air fule ratio";
        parameter Real EA=0.5 "excess air fraction";
        parameter Modelica.SIunits.SpecificHeatCapacity cp_G=4186*0.28
          "mean specific heat of flue gas";

        WaterHeaterLib.BaseClasses.TFlame     T_AD_flame(
          deltaHc_H=deltaHc_H,
          stoich=stoich,
          EA=EA,
          cp_G=cp_G) annotation (Placement(transformation(
              extent={{-15,-15},{15,15}},
              rotation=0,
              origin={-105,-79})));
        WaterHeaterLib.BaseClasses.InteriorWH heaGasBas(
          each hFixed=hFixed,
          final til=datTanEnvBot.til,
          final A=datTanEnvBot.A,
          each conMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature)
          "Heat transfer between the gas and the base of the tank"
                                     annotation (Placement(transformation(
              extent={{-14,14},{14,-14}},
              rotation=90,
              origin={0,90})));
        Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
          hotGasTemperature1 annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={0,44})));
        WaterHeaterLib.BaseClasses.hRB  h_RB annotation (Placement(
              transformation(
              extent={{16,-16},{-16,16}},
              rotation=270,
              origin={48,-116})));
        Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TtanBot
          "tank bottom temperature"
          annotation (Placement(transformation(extent={{-48,-60},{-32,-44}})));
        WaterHeaterLib.BaseClasses.LongWaveRadiationExchange radGasFlr(A=
              datTanEnvBot.A)
          "Radiative heat transfer between the gas in the burner and the floor"
                                                 annotation (Placement(
              transformation(
              extent={{17,-16},{-17,16}},
              rotation=90,
              origin={0,-277})));
        Modelica.Blocks.Sources.RealExpression realExpression5(y=1/(2/
              datTanEnv.layers.absIR_b + (1/absIR_FS)*(1/(absIR_Fla*fv) + 1)
               - 1)) annotation (Placement(transformation(extent={{158,-246},{
                  104,-216}})));
        WaterHeaterLib.BaseClasses.THotGas  hotGasTemp(A_B=datTanEnvBot.A)
          annotation (Placement(transformation(
              extent={{16,-16},{-16,16}},
              rotation=270,
              origin={0,-2})));
        WaterHeaterLib.BaseClasses.TF0  T_F0(final deltaHc_H=deltaHc_H, final
            deltaHc_L=deltaHc_L)
          annotation (Placement(transformation(extent={{344,4},{376,36}})));
        Modelica.Blocks.Interfaces.RealInput QBurner annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={100,-378}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={216,-282})));

        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{268,6},{290,28}})));
        WaterHeaterLib.BaseClasses.hCB  h_CB(DT=DTan, DF=DFlu) annotation (
            Placement(transformation(
              extent={{-16,-16},{16,16}},
              rotation=90,
              origin={0,-116})));
        Modelica.Blocks.Interfaces.RealInput TDryBul annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-100,-376}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-122,-284})));
        Modelica.Blocks.Sources.RealExpression fsRadiationExchange4_Q_flow(y=
              radGasFlr.port.Q_flow)
          annotation (Placement(transformation(extent={{174,-20},{232,18}})));
        WaterHeaterLib.BaseClasses.cdotG  cdot_G annotation (Placement(
              transformation(
              extent={{-16,-16},{16,16}},
              rotation=90,
              origin={106,-114})));
        Modelica.Blocks.Sources.RealExpression heaCoef(y=h_GB)
          "heat transfer hot gas to tank base --fixme"
          annotation (Placement(transformation(extent={{-152,72},{-88,108}})));
        Modelica.Blocks.Interfaces.RealInput Q_B "heat flow rate of the base"
          annotation (Placement(transformation(
              extent={{20,-20},{-20,20}},
              rotation=90,
              origin={176,238}), iconTransformation(
              extent={{20,-20},{-20,20}},
              rotation=90,
              origin={8,142})));
        Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorTop
          "Heat port top of burner" annotation (Placement(transformation(extent=
                 {{-14,212},{14,240}}, rotation=0), iconTransformation(extent={
                  {-160,120},{-120,160}})));

        parameter Buildings.Rooms.BaseClasses.ParameterConstruction datTanEnv(
          each A=0,
          redeclare Buildings.HeatTransfer.Data.OpaqueConstructions.Brick120 layers,
          each til=0,
          each azi=0) "Data for exterior construction" annotation (Placement(
              transformation(extent={{406,106},{446,146}})),HideResult=true);
        Modelica.Blocks.Interfaces.RealOutput T_F0_y annotation (Placement(
              transformation(
              extent={{-16,-16},{16,16}},
              rotation=90,
              origin={274,236}), iconTransformation(
              extent={{-16,-16},{16,16}},
              rotation=90,
              origin={134,140})));
        Modelica.Blocks.Interfaces.RealOutput cdot_G_y annotation (Placement(
              transformation(
              extent={{-16,-16},{16,16}},
              rotation=90,
              origin={332,236}), iconTransformation(
              extent={{-16,-16},{16,16}},
              rotation=90,
              origin={258,136})));
      equation

        connect(hotGasTemperature1.port, heaGasBas.solid)   annotation (Line(
            points={{1.83697e-015,54},{1.83697e-015,76},{9.19104e-016,76}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(hotGasTemp.y, hotGasTemperature1.T) annotation (Line(
            points={{3.23307e-015,15.6},{3.23307e-015,28},{-2.20436e-015,28},{
                -2.20436e-015,32}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(TtanBot.T, hotGasTemp.T_WL) annotation (Line(
            points={{-32,-52},{-12.8,-52},{-12.8,-21.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hotGasTemp.T_AD, T_AD_flame.y) annotation (Line(
            points={{-6.4,-21.2},{-6.4,-74.5},{-88.5,-74.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(h_CB.y, hotGasTemp.h_CB) annotation (Line(
            points={{1.07769e-015,-98.4},{1.07769e-015,-66.2},{-3.52698e-015,
                -66.2},{-3.52698e-015,-21.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(h_RB.y, hotGasTemp.h_RB) annotation (Line(
            points={{48,-98.4},{48,-80},{6.4,-80},{6.4,-21.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(cdot_G.y, hotGasTemp.C_dotG) annotation (Line(
            points={{106,-96.4},{106,-70},{12.8,-70},{12.8,-21.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(h_CB.C_dotG, cdot_G.y) annotation (Line(
            points={{-1.17566e-015,-135.2},{-1.17566e-015,-150},{162,-150},{162,
                -70},{106,-70},{106,-96.4}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(heaCoef.y, heaGasBas.u)   annotation (Line(
            points={{-84.8,90},{-16.8,90}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T_AD_flame.y, cdot_G.T_AD) annotation (Line(
            points={{-88.5,-74.5},{-74,-74.5},{-74,-176},{106,-176},{106,-133.52}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(radGasFlr.u, realExpression5.y)            annotation (Line(
            points={{1.24914e-015,-256.6},{1.24914e-015,-232},{101.3,-232},{
                101.3,-231}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(radGasFlr.port, heaPorBot)            annotation (Line(
            points={{-0.32,-294.68},{-0.32,-326.26},{1.77636e-015,-326.26},{
                1.77636e-015,-368}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(heaPorBot, heaPorBot) annotation (Line(
            points={{1.77636e-015,-368},{1,-369},{0,-370},{1.77636e-015,-368}},
            color={191,0,0},
            smooth=Smooth.None));

        connect(T_AD_flame.y, radGasFlr.T_In)            annotation (Line(
            points={{-88.5,-74.5},{-74,-74.5},{-74,-277},{-19.2,-277}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(TDryBul, T_AD_flame.TDryBul) annotation (Line(
            points={{-100,-376},{-100,-316},{-142,-316},{-142,-70},{-123,-70}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(QBurner, T_AD_flame.QBurner) annotation (Line(
            points={{100,-378},{100,-340},{-156,-340},{-156,-82},{-123,-82}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(TDryBul, cdot_G.TDryBul) annotation (Line(
            points={{-100,-376},{-100,-314},{194,-314},{194,-123.6},{125.2,-123.6}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(QBurner, cdot_G.QIn) annotation (Line(
            points={{100,-378},{100,-338},{242,-338},{242,-114},{125.2,-114}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(fsRadiationExchange4_Q_flow.y, add.u2) annotation (Line(
            points={{234.9,-1},{246,-1},{246,10.4},{265.8,10.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(TDryBul, T_F0.TDryBul) annotation (Line(
            points={{-100,-376},{-100,-314},{322,-314},{322,20},{340.8,20}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(Q_B, add.u1) annotation (Line(
            points={{176,238},{176,23.6},{265.8,23.6}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(heaGasBas.fluid, heaPorTop)   annotation (Line(
            points={{2.63361e-015,104},{2.63361e-015,163},{1.77636e-015,163},{
                1.77636e-015,226}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(TtanBot.port, heaPorTop) annotation (Line(
            points={{-48,-52},{-62,-52},{-62,200},{1.77636e-015,200},{
                1.77636e-015,226}},
            color={191,0,0},
            smooth=Smooth.None));

        connect(T_F0.y, T_F0_y) annotation (Line(
            points={{377.6,20},{402,20},{402,78},{274,78},{274,236}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(cdot_G.y, cdot_G_y) annotation (Line(
            points={{106,-96.4},{106,102},{332,102},{332,236}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(QBurner, T_F0.QIn) annotation (Line(
            points={{100,-378},{100,-294},{350,-294},{350,0.8},{350.08,0.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add.y, T_F0.QLoss) annotation (Line(
            points={{291.1,17},{304,17},{304,-20},{358.08,-20},{358.08,0.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(cdot_G.y, T_F0.C_dot_G) annotation (Line(
            points={{106,-96.4},{106,-66},{366,-66},{366,0.8},{366.4,0.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(h_RB.T_WL, TtanBot.T) annotation (Line(
            points={{67.2,-116},{74,-116},{74,-162},{-32,-162},{-32,-52}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T_AD_flame.y, h_RB.T_AD) annotation (Line(
            points={{-88.5,-74.5},{-58,-74.5},{-58,-194},{20,-194},{20,-116},{
                28.8,-116}},
            color={0,0,127},
            smooth=Smooth.None));

        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-340,-360},
                  {460,220}}), graphics),
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-340,-360},{
                  460,220}}), graphics={Bitmap(
                extent={{-270,150},{364,-272}},
                imageSource=
                    "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",
                fileName="C:/Documents and Settings/user/Desktop/chamber.jpg")}),
          defaultComponentName="burn",
          Documentation(info="<html>
<p>
This is a model of a gas burner.
</p>
<p>
The tank has <code>nSeg</code> fluid volumes. The top volume has the index <code>1</code>.
Thus, to add a heating element to the bottom element, connect a heat input to
<code>heaPorVol[nSeg]</code>.
</p>
</html>", revisions="<html>
<ul>
<li>
May 15, 2011 by Thierry S. Nouidui:<br>
First implementation.
</li>
</ul>
</html>"),Icon(graphics={Rectangle(
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
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                  {100,100}}), graphics));
      end Gas;

      package Examples
        model Gas
          import WaterHeaterLib;
          Modelica.Blocks.Sources.Constant TDryBul(k=273.15 + 21)
            annotation (Placement(transformation(extent={{78,-36},{58,-16}})));
          Buildings.HeatTransfer.Sources.PrescribedTemperature TBCBot
            "Boundary condition for tank" annotation (Placement(transformation(
                extent={{6,-6},{-6,6}},
                rotation=180,
                origin={-40,-34})));
          Modelica.Blocks.Sources.Constant TFloor(k=273.15 + 15) annotation (
              Placement(transformation(extent={{-96,-44},{-76,-24}})));
          Modelica.Blocks.Sources.Constant QBurner(k=13180)
            annotation (Placement(transformation(extent={{78,-70},{58,-50}})));
          Modelica.Blocks.Sources.Constant QLoss(k=0)
            annotation (Placement(transformation(extent={{80,40},{60,60}})));
          Modelica.Blocks.Sources.Constant TFloor1(k=273.15 + 30)
            annotation (Placement(transformation(extent={{-98,48},{-78,68}})));
          Buildings.HeatTransfer.Sources.PrescribedTemperature TBCBot1
            "Boundary condition for tank" annotation (Placement(transformation(
                extent={{6,-6},{-6,6}},
                rotation=180,
                origin={-42,58})));
          WaterHeaterLib.BaseClasses.Burner.Gas burn
            annotation (Placement(transformation(extent={{-28,-20},{52,38}})));
        equation
          connect(TFloor.y, TBCBot.T) annotation (Line(
              points={{-75,-34},{-47.2,-34}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(TFloor1.y, TBCBot1.T) annotation (Line(
              points={{-77,58},{-49.2,58}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(TBCBot.port, burn.heaPorBot) annotation (Line(
              points={{-34,-34},{9.6,-34},{9.6,-12.4}},
              color={191,0,0},
              smooth=Smooth.None));
          connect(TBCBot1.port, burn.heaPorTop) annotation (Line(
              points={{-36,58},{-8,58},{-8,30}},
              color={191,0,0},
              smooth=Smooth.None));
          connect(TDryBul.y, burn.TDryBul) annotation (Line(
              points={{57,-26},{-6.2,-26},{-6.2,-12.4}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(QBurner.y, burn.QBurner) annotation (Line(
              points={{57,-60},{27.6,-60},{27.6,-12.2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(QLoss.y, burn.Q_B) annotation (Line(
              points={{59,50},{6.8,50},{6.8,30.2}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end Gas;
      end Examples;
    end Burner;

    package Examples
      model cdotG "this is an example for cdotG"
        import WaterHeaterLib;
        WaterHeaterLib.BaseClasses.cdotG  cdot_G
          annotation (Placement(transformation(extent={{12,26},{32,46}})));
        Modelica.Blocks.Sources.Constant T_AD_flame(k=273.15 + 1000)
          annotation (Placement(transformation(extent={{-46,26},{-26,46}})));
        Modelica.Blocks.Sources.Constant T_Dry_Bul(k=273.15 + 20)
          annotation (Placement(transformation(extent={{-44,-18},{-24,2}})));
        Modelica.Blocks.Sources.Constant QBurner(k=13180)
          annotation (Placement(transformation(extent={{-44,-52},{-24,-32}})));
      equation
        connect(T_AD_flame.y, cdot_G.T_AD) annotation (Line(
            points={{-25,36},{9.8,36}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T_Dry_Bul.y, cdot_G.TDryBul) annotation (Line(
            points={{-23,-8},{16,-8},{16,24}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(QBurner.y, cdot_G.QIn) annotation (Line(
            points={{-23,-42},{22,-42},{22,24}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end cdotG;

      model TFlame "this is an example for TFlame"
        import WaterHeaterLib;
        WaterHeaterLib.BaseClasses.TFlame     t_AD_Flame
          annotation (Placement(transformation(extent={{22,-12},{42,8}})));
        Modelica.Blocks.Sources.Constant T_Dry_Bul(k=273.15 + 20)
          annotation (Placement(transformation(extent={{-40,14},{-20,34}})));
        Modelica.Blocks.Sources.Constant QBurner(k=13180)
          annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
      equation
        connect(T_Dry_Bul.y, t_AD_Flame.TDryBul) annotation (Line(
            points={{-19,24},{0,24},{0,4},{20,4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(QBurner.y, t_AD_Flame.QBurner) annotation (Line(
            points={{-19,-20},{0,-20},{0,-4},{20,-4}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TFlame;

      model THotGas "this is an example for THotGas"
        import WaterHeaterLib;
        WaterHeaterLib.BaseClasses.THotGas  t_hotGas
          annotation (Placement(transformation(extent={{58,6},{78,26}})));
        Modelica.Blocks.Sources.Constant h_RB(k=2)
          annotation (Placement(transformation(extent={{-80,22},{-60,42}})));
        Modelica.Blocks.Sources.Constant C_dot_G(k=1e4)
          annotation (Placement(transformation(extent={{-80,58},{-60,78}})));
        Modelica.Blocks.Sources.Constant h_CB(k=600)
          annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
        Modelica.Blocks.Sources.Constant T_AD_Flame(k=1000)
          annotation (Placement(transformation(extent={{-80,-46},{-60,-26}})));
        Modelica.Blocks.Sources.Constant T_Wall(k=273.15 + 20)
          annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
      equation
        connect(C_dot_G.y, t_hotGas.C_dotG) annotation (Line(
            points={{-59,68},{-18,68},{-18,24},{56,24}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(h_RB.y, t_hotGas.h_RB) annotation (Line(
            points={{-59,32},{-18,32},{-18,20},{56,20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(h_CB.y, t_hotGas.h_CB) annotation (Line(
            points={{-59,0},{-16,0},{-16,16},{56,16}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T_AD_Flame.y, t_hotGas.T_AD) annotation (Line(
            points={{-59,-36},{-18,-36},{-18,12},{56,12}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T_Wall.y, t_hotGas.T_WL) annotation (Line(
            points={{-59,-70},{-2,-70},{-2,8},{56,8}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end THotGas;

      model mDotDExample
        mDCal mDCal1(nSeg=3)
          annotation (Placement(transformation(extent={{-18,-6},{2,14}})));
        Modelica.Blocks.Sources.RealExpression mDotB(y=1)
          annotation (Placement(transformation(extent={{-92,10},{-72,30}})));
        Modelica.Blocks.Sources.RealExpression mDotIn[3](y=7/3)
          annotation (Placement(transformation(extent={{-92,-6},{-72,14}})));
        Modelica.Blocks.Sources.RealExpression mDotF[3](y=2)
          annotation (Placement(transformation(extent={{-92,-22},{-72,-2}})));
      equation
        connect(mDotF.y, mDCal1.mDotFlu) annotation (Line(
            points={{-71,-12},{-46,-12},{-46,-5},{-20,-5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(mDotIn.y, mDCal1.mDotIn) annotation (Line(
            points={{-71,4},{-20,4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(mDotB.y, mDCal1.mDotBas) annotation (Line(
            points={{-71,20},{-46,20},{-46,13},{-20,13}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end mDotDExample;

      model dHBUExample
        package Medium = Modelica.Media.Water.WaterIF97_ph "Medium model";
        dHBU dHBU1(nSeg=3, redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{-12,-6},{8,14}})));
        Modelica.Blocks.Sources.Constant TWat[3](k=45)
          annotation (Placement(transformation(extent={{-92,-6},{-72,14}})));
        Modelica.Blocks.Sources.Constant THotBas(k=70)
          annotation (Placement(transformation(extent={{-92,26},{-72,46}})));
        Modelica.Blocks.Sources.Constant mDotBas(k=0.05)
          annotation (Placement(transformation(extent={{-92,56},{-72,76}})));
        Modelica.Blocks.Sources.Constant mDotFlu[3](k=0.02)
          annotation (Placement(transformation(extent={{-92,-36},{-72,-16}})));
        Modelica.Blocks.Sources.Constant THotFlu[3](k=60)
          annotation (Placement(transformation(extent={{-92,-66},{-72,-46}})));
      equation
        connect(mDotBas.y, dHBU1.mDotBas) annotation (Line(
            points={{-71,66},{-28,66},{-28,12},{-14,12}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(THotBas.y, dHBU1.THotBas) annotation (Line(
            points={{-71,36},{-32,36},{-32,8},{-14,8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(TWat.y, dHBU1.TWat) annotation (Line(
            points={{-71,4},{-14,4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(mDotFlu.y, dHBU1.mDotFlu) annotation (Line(
            points={{-71,-26},{-32,-26},{-32,0},{-14,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(THotFlu.y, dHBU1.THotFlu) annotation (Line(
            points={{-71,-56},{-28,-56},{-28,-4},{-14,-4}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end dHBUExample;

      model QBuoExample
        package Medium = Modelica.Media.Water.WaterIF97_ph "Medium model";

        QBuo qBuo(
          redeclare package Medium = Medium,
          nSeg=3,
          m_flow_C=0.0012)
                  annotation (Placement(transformation(extent={{-4,-10},{16,10}})));
        Modelica.Blocks.Sources.Constant mDotD[3](k=0.05)
          annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
        Modelica.Blocks.Sources.Constant TWat[3](k=45)
          annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
        Modelica.Blocks.Sources.Constant dHBU[3](k=15)
          annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));
        Modelica.Blocks.Sources.Constant QBas(k=100)
          annotation (Placement(transformation(extent={{-90,50},{-70,70}})));
        Modelica.Blocks.Sources.Constant QFlu[3](k=100)
          annotation (Placement(transformation(extent={{-90,-70},{-70,-50}})));
      equation
        connect(mDotD.y, qBuo.mDotD) annotation (Line(
            points={{-69,30},{-38,30},{-38,6},{-6,6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(TWat.y, qBuo.TWat) annotation (Line(
            points={{-69,0},{-6,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(dHBU.y, qBuo.dHBU) annotation (Line(
            points={{-69,-30},{-38,-30},{-38,-6},{-6,-6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(QFlu.y, qBuo.QFlu) annotation (Line(
            points={{-69,-60},{-26,-60},{-26,-10},{-6,-10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(QBas.y, qBuo.QBas) annotation (Line(
            points={{-69,60},{-26,60},{-26,10},{-6,10}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end QBuoExample;

      model buoHeaTraExample
        "Provides an example on the use of the model buoHeaTra"
          package Medium = Modelica.Media.Water.WaterIF97_ph "Medium model";

        buoHeaTra buoHeaTra1(nSeg=10, redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{58,0},{78,20}})));
        Modelica.Blocks.Sources.Constant QDotBas(k=-2000)
          annotation (Placement(transformation(extent={{-8,16},{12,36}})));
        Modelica.Blocks.Sources.Constant QDotFlu[10](k=-2000)
          annotation (Placement(transformation(extent={{-8,-100},{12,-80}})));
        Buildings.Fluid.MixingVolumes.MixingVolume vol[10](V=0.014, m_flow_nominal=0.001,
          redeclare package Medium = Medium)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-32,12})));
        Modelica.Blocks.Sources.RealExpression realExpression[10](y=buoHeaTra1.buoHeaTra)
          annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));
        Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow
          prescribedHeatFlow[10]
          annotation (Placement(transformation(extent={{-46,-46},{-32,-32}})));
        Modelica.Blocks.Sources.Constant QLosTop(k=1000)
          annotation (Placement(transformation(extent={{-8,60},{12,80}})));
      equation

        connect(QDotBas.y, buoHeaTra1.QDotBas) annotation (Line(
            points={{13,26},{20.5,26},{20.5,0},{56,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(QDotFlu.y, buoHeaTra1.QDotFlu) annotation (Line(
            points={{13,-90},{46,-90},{46,8},{56,8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(vol.heatPort, buoHeaTra1.TWat) annotation (Line(
            points={{-22,12},{-22,-38},{36,-38},{36,13.6},{57.4,13.6}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(realExpression.y, prescribedHeatFlow.Q_flow) annotation (Line(
            points={{-59,-40},{-52,-40},{-52,-39},{-46,-39}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(prescribedHeatFlow.port, vol.heatPort) annotation (Line(
            points={{-32,-39},{-28,-39},{-28,-38},{-22,-38},{-22,12}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(QLosTop.y, buoHeaTra1.QLosTop) annotation (Line(
            points={{13,70},{40,70},{40,18},{56,18}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end buoHeaTraExample;

      model T_F0Example
        TF0 tF0_1
          annotation (Placement(transformation(extent={{18,-12},{38,8}})));
        Modelica.Blocks.Sources.Constant TAmb(k=273.15 + 20)
          annotation (Placement(transformation(extent={{-64,-12},{-44,8}})));
        Modelica.Blocks.Sources.Constant Qin(k=10000)
          annotation (Placement(transformation(extent={{-22,-80},{-2,-60}})));
        Modelica.Blocks.Sources.Constant QLoss(k=-8000)
                                                       annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={28,-70})));
        Modelica.Blocks.Sources.Constant cDotG(k=7.9) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={72,-70})));
      equation
        connect(TAmb.y, tF0_1.TDryBul) annotation (Line(
            points={{-43,-2},{16,-2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(QLoss.y, tF0_1.QLoss) annotation (Line(
            points={{28,-59},{28,-14},{26.8,-14}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Qin.y, tF0_1.QIn) annotation (Line(
            points={{-1,-70},{6,-70},{6,-24},{21.8,-24},{21.8,-14}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(cDotG.y, tF0_1.C_dot_G) annotation (Line(
            points={{61,-70},{48,-70},{48,-20},{32,-20},{32,-14}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end T_F0Example;

      model minFloInExample

        parameter Integer nSeg(min=1) = 5;

        minFloIn minFloIn1(
          nSeg=nSeg,
          perInA={4.0134,6.1873,-0.4415,2.8428,-1.0033},
          perInB={-2.0619,-2.8662,-0.2213,0.102,1.1405},
          perInC={0.4896,0.5048,0.2329,-0.0032,-0.0224})
          annotation (Placement(transformation(extent={{-10,0},{10,20}})));
        Modelica.Blocks.Sources.Constant const[nSeg](k=0.12)
          annotation (Placement(transformation(extent={{-80,8},{-60,28}})));
      equation
        connect(const.y, minFloIn1.m_flow_in) annotation (Line(
            points={{-59,18},{-12,18}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end minFloInExample;

      model timDelExample
        "Provides an example using the time delay (timDel) model"
        parameter Integer nSeg(min=1) = 8;

        timDel timDel1(nSeg=nSeg,
          timDelB={0,-14.047,79.1,475.76,805.42,792.21,802.41,812.61},
          timDelC={0,0.2408,21.676,14.305,8.1676,8.2512,7.9334,7.6157},
          timDelA={0,100.33,-567.21,-1971.9,-3112.4,-2660.9,-2376.6,-2092.3})
          annotation (Placement(transformation(extent={{-18,6},{2,26}})));
        Modelica.Blocks.Sources.Constant const[nSeg](k=0.02)
          annotation (Placement(transformation(extent={{-86,14},{-66,34}})));
      equation
        connect(const.y, timDel1.m_flow_in) annotation (Line(
            points={{-65,24},{-20,24}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end timDelExample;

      model draHeaTraExample "Provides an example of how draHeaTra is used"
          package Medium = Modelica.Media.Water.WaterIF97_ph "Medium model";
        parameter Integer nSeg(min=1) = 8;

        draHeaTra draHeaTra1(nSeg=nSeg, redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{0,8},{20,28}})));
        Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds[nSeg](
          tableOnFile=true,
          tableName="Flow",
          fileName="StorageTankDrawProfile.txt")
          annotation (Placement(transformation(extent={{-64,4},{-44,24}})));
        Modelica.Blocks.Sources.RealExpression realExpression[nSeg](y=time)
          annotation (Placement(transformation(extent={{-98,4},{-78,24}})));
        Modelica.Blocks.Sources.Constant const[nSeg](k={273.105 + 20,273.105 +
              30,273.105 + 40,273.105 + 50,273.105 + 60,273.105 + 70,273.105 +
              80,273.105 + 90})
          annotation (Placement(transformation(extent={{-68,36},{-48,56}})));
      equation
        connect(realExpression.y, combiTable1Ds.u) annotation (Line(
            points={{-77,14},{-66,14}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(combiTable1Ds.y[1], draHeaTra1.mFloIn) annotation (Line(
            points={{-43,14},{-22,14},{-22,13},{-2,13}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(const.y, draHeaTra1.TWat) annotation (Line(
            points={{-47,46},{-22,46},{-22,25.2},{-2,25.2}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end draHeaTraExample;

      model QEleExample
        "Provides an example of how the model describing electricty consumption is used"
        QEle qEle(QEleIdl=5, QEleAct=150)
          annotation (Placement(transformation(extent={{40,-30},{60,-10}})));
        Modelica.Blocks.Logical.OnOffController onOffController(bandwidth=12)
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=180,
              origin={-46,26})));
        Modelica.Blocks.Sources.Constant T_Set(k=273.105 + 48)
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=180,
              origin={-82,20})));
        Modelica.Blocks.Math.BooleanToReal booleanToInteger
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=180,
              origin={-14,26})));
        Modelica.Blocks.Sources.Sine sine(
          amplitude=12,
          freqHz=0.05,
          offset=273.105 + 48)
          annotation (Placement(transformation(extent={{-96,54},{-76,74}})));
      equation
        connect(onOffController.y, booleanToInteger.u) annotation (Line(
            points={{-35,26},{-26,26}},
            color={255,0,255},
            smooth=Smooth.None));
        connect(T_Set.y, onOffController.reference) annotation (Line(
            points={{-71,20},{-58,20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sine.y, onOffController.u) annotation (Line(
            points={{-75,64},{-66,64},{-66,32},{-58,32}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(booleanToInteger.y, qEle.BurnerStatus) annotation (Line(
            points={{-3,26},{20,26},{20,-20},{38,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end QEleExample;
    end Examples;

    model strLay "Identifies the height of the boundary layer"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      import Buildings;

      parameter Integer nSeg(min=2) = 3;
      Real smoDel = 0.0001;
      parameter Real QDotPilot;

      Modelica.Blocks.Interfaces.RealInput TWat[nSeg]
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
      Modelica.Blocks.Interfaces.RealOutput strLay[nSeg]
        annotation (Placement(transformation(extent={{100,-16},{132,16}})));
    equation

      //Defines the bottom segment as always being below the stratification layer
      strLay[nSeg] = 0;

      for i in 1:(nSeg-1) loop

        //Checks the location of each segment relative to the stratification layer. Two checks:
        //  1) Compares the temperature of the active segment to the temperature of the segment below. If the temperature difference is less than the smoothing range it is considered to be under the stratification layer
        //  2) Checks the status of the segment below. If that segment is below the stratification layer, then the top layer can also be considered below the stratification layer

    //    if timer.y > 0 and strLay[nSeg-i] > 0 then
          strLay[nSeg-i] = min(1,Buildings.Utilities.Math.Functions.smoothHeaviside(TWat[nSeg-i] - TWat[nSeg-i+1] - 0.2 - smoDel, smoDel) + Buildings.Utilities.Math.Functions.smoothHeaviside(strLay[nSeg-i+1]-0.1,smoDel));
    //     elseif timer.y < 1 then
    //       strLay[nSeg-i] = 1;
    //     else
    //       strLay[nSeg-i] = 0;
    //     end if;

      end for;

      annotation (Diagram(graphics));
    end strLay;

    model heaSum
      "Sums all the heat entering the water below the stratification layer"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      parameter Integer nSeg(min=2) = 3;
      Real heaBelStr[nSeg];
      Real smoDel = 0.0001;

      Modelica.Blocks.Interfaces.RealInput strLay[nSeg]
        annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
      Modelica.Blocks.Interfaces.RealInput QDotFlu
        annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
      Modelica.Blocks.Interfaces.RealInput QDotBas
        annotation (Placement(transformation(extent={{-140,-120},{-100,-80}})));
      Modelica.Blocks.Interfaces.RealOutput QBelStrTot
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));

      Modelica.Blocks.Interfaces.RealInput QLosTop
        annotation (Placement(transformation(extent={{-140,80},{-100,120}})));
    equation

      // Identifies the heat transfer below the stratification layer caused by the top segment. Includes both heat in from the flue, and losses out through the top. In from the flue is only included if the segment is considered below the stratification layer
      heaBelStr[1] = QDotFlu/nSeg * Buildings.Utilities.Math.Functions.smoothHeaviside(1 - strLay[1] - 0.1,smoDel) - QLosTop;

      // Identifies the heat below the stratification layer caused by flue heat transfer for each segment in the tank. The value is only included if a segment is considered below the stratification layer
      for i in 2:(nSeg - 1) loop
        heaBelStr[i] = QDotFlu/nSeg * Buildings.Utilities.Math.Functions.smoothHeaviside(1 - strLay[i] - 0.1,smoDel);
      end for;

      //  Identifies the heat below the stratification layer caused by heat transfer into the bottom segment. Includes both the flue and base heat transfer. Only added if the bottom segment is considered below the stratification layer
      heaBelStr[nSeg] =  QDotFlu/nSeg * Buildings.Utilities.Math.Functions.smoothHeaviside(1 - strLay[nSeg] - 0.1,smoDel) + QDotBas * Buildings.Utilities.Math.Functions.smoothHeaviside(1 - strLay[nSeg] - 0.1,smoDel);

      //  Sums up all of the heat added below the stratification layer. It will be divided evenly between all segments below the stratification layer in a separate model
      QBelStrTot = sum(heaBelStr[1:nSeg]);

      annotation (Diagram(graphics));
    end heaSum;

    model QIn "Identifies the amount of heat entering each segment"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      parameter Integer nSeg(min=2) = 2;
      Real smoDel = 0.0001;
      Real QIn[nSeg];
      Real heaPerSeg;

      Modelica.Blocks.Interfaces.RealInput strLay[nSeg]
        annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
      Modelica.Blocks.Interfaces.RealInput heaBelStrTot
        annotation (Placement(transformation(extent={{-140,0},{-100,40}})));
      Modelica.Blocks.Interfaces.RealOutput QInCom[nSeg]
        "Identifies the heat entering each segment"
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Interfaces.RealInput QDotFlu
        annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
      Modelica.Blocks.Interfaces.RealInput QDotBas
        annotation (Placement(transformation(extent={{-140,-120},{-100,-80}})));
      Modelica.Blocks.Interfaces.RealInput TWat[nSeg]
        annotation (Placement(transformation(extent={{-140,-40},{-100,0}})));
      Modelica.Blocks.Interfaces.RealInput QLosTop
        annotation (Placement(transformation(extent={{-140,80},{-100,120}})));
    equation

      //  Identifies the amount of heat to add to each segment below the stratification layer. Accomplished by dividing the total heat below the stratification layer by the number of segments below the stratification layer
      heaPerSeg = heaBelStrTot / (nSeg - sum(strLay[1:nSeg]));

      for i in 1:(nSeg-1) loop

        //  Calculates the heat entering each segment. If a segment is below the stratification layer, value is heaPerSeg. If above the stratification layer, value is QDotFlu
        QIn[i] = heaPerSeg * Buildings.Utilities.Math.Functions.smoothHeaviside(TWat[i+1] - TWat[i] + 0.1 - smoDel, smoDel) + QDotFlu/nSeg * Buildings.Utilities.Math.Functions.smoothHeaviside(TWat[i] - TWat[i+1] - 0.1, smoDel);
      end for;

      //  Performs the same calculation for the bottom segment
      QIn[nSeg] = heaPerSeg * Buildings.Utilities.Math.Functions.smoothHeaviside((1 - smoDel) - strLay[nSeg], smoDel) + QDotBas * Buildings.Utilities.Math.Functions.smoothHeaviside(strLay[nSeg] - smoDel, smoDel);

      //  Identifies the final heat transfer into each segment. Does so combining flu/base/loss heat transfers to Qin to ensure that no heat transfer is double counted
      QInCom[1] = QIn[1] - QDotFlu/nSeg - QLosTop;
      for i in 2:(nSeg-1) loop
        QInCom[i] = QIn[i] - QDotFlu/nSeg;
      end for;

      QInCom[nSeg] = QIn[nSeg] - QDotFlu/nSeg - QDotBas;
      annotation (Diagram(graphics));
    end QIn;

    model minFloIn
      "Identifies the minimum inlet water flow entering each segment"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      parameter Real perInA[nSeg]= {4.0134};
      parameter Real perInB[nSeg] = {-2.0619};
      parameter Real perInC[nSeg] = {0.4896};
      parameter Integer nSeg(min = 1) = 1;
      Modelica.Blocks.Interfaces.RealInput m_flow_in[nSeg]
        annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
      Modelica.Blocks.Sources.RealExpression realExpression[nSeg](y=perInA)
        annotation (Placement(transformation(extent={{-70,36},{-50,56}})));
      Modelica.Blocks.Sources.RealExpression realExpression1[nSeg](y=perInB)
        annotation (Placement(transformation(extent={{-70,4},{-50,24}})));
      Modelica.Blocks.Sources.RealExpression realExpression2[nSeg](y=perInC)
        annotation (Placement(transformation(extent={{-70,-26},{-50,-6}})));
      Modelica.Blocks.Math.Product product1[nSeg]
        annotation (Placement(transformation(extent={{-30,64},{-10,84}})));
      Modelica.Blocks.Math.Product product2[nSeg]
        annotation (Placement(transformation(extent={{2,42},{22,62}})));
      Modelica.Blocks.Math.Product product3[nSeg]
        annotation (Placement(transformation(extent={{0,10},{20,30}})));
      Modelica.Blocks.Math.Add3 add3_1[nSeg]
        annotation (Placement(transformation(extent={{64,10},{84,30}})));
      Modelica.Blocks.Interfaces.RealOutput y[nSeg]
        annotation (Placement(transformation(extent={{100,10},{120,30}})));
    equation

      connect(m_flow_in, product1.u1) annotation (Line(
          points={{-120,80},{-32,80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(m_flow_in, product1.u2) annotation (Line(
          points={{-120,80},{-58,80},{-58,68},{-32,68}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, product2.u1) annotation (Line(
          points={{-9,74},{-6,74},{-6,58},{0,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression.y, product2.u2) annotation (Line(
          points={{-49,46},{0,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product2.y, add3_1.u1) annotation (Line(
          points={{23,52},{46,52},{46,28},{62,28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(m_flow_in, product3.u1) annotation (Line(
          points={{-120,80},{-86,80},{-86,26},{-2,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression1.y, product3.u2) annotation (Line(
          points={{-49,14},{-2,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product3.y, add3_1.u2) annotation (Line(
          points={{21,20},{62,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression2.y, add3_1.u3) annotation (Line(
          points={{-49,-16},{48,-16},{48,12},{62,12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add3_1.y, y) annotation (Line(
          points={{85,20},{110,20}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(graphics));
    end minFloIn;

    function readIntegerParameter
      "Read the value of a Real parameter from file"
      import Modelica.Utilities.*;
      extends Modelica.Icons.Function;
      input String fileName "Name of file"       annotation(Dialog(
                             __Dymola_loadSelector(filter="Text files (*.txt)",
                             caption="Open file in which Real parameters are present")));
      input String name "Name of parameter";
      output Integer result "Actual value of parameter on file";

    protected
      String line;
      String identifier;
      String delimiter;
      Integer nextIndex;
      Integer iline=1;
      Modelica.Utilities.Types.TokenValue token;
      String message = "in file \"" + fileName + "\" on line ";
      String message2;
      Boolean found = false;
      Boolean endOfFile=false;
    algorithm
     (line, endOfFile) :=Modelica.Utilities.Streams.readLine(fileName, iline);

      while not found and not endOfFile loop
        (token, nextIndex) := Modelica.Utilities.Strings.scanToken(line);
         if token.tokenType == Modelica.Utilities.Types.TokenType.NoToken then
            // skip line
            iline := iline + 1;
         elseif token.tokenType == Modelica.Utilities.Types.TokenType.IdentifierToken then
            if token.string == name then
               // name found, get value of "name = value;"
               message2 := message + String(iline);
               (delimiter,nextIndex) := Modelica.Utilities.Strings.scanDelimiter(line, nextIndex, {"="}, message2);
               (result,nextIndex)    := WaterHeaterLib.BaseClasses.integerExpression(line, nextIndex, message2);
               (delimiter,nextIndex) := Modelica.Utilities.Strings.scanDelimiter(line, nextIndex, {";", ""}, message2);
               Modelica.Utilities.Strings.scanNoToken(line, nextIndex, message2);
               found := true;
            else
               // wrong name, skip line
               iline := iline + 1;
            end if;
         else
            // wrong token
            Modelica.Utilities.Strings.syntaxError(line, nextIndex, "Expected identifier " + message + String(iline));
         end if;

         // read next line
         (line, endOfFile) :=Modelica.Utilities.Streams.readLine(fileName, iline);
      end while;

      if not found then
         Modelica.Utilities.Streams.error("Parameter \"" + name + "\" not found in file \"" + fileName + "\"");
      end if;

      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
result = <b>readRealParameter</b>(fileName, name);
</pre></blockquote>
<h4>Description</h4>
<p>
This function demonstrates how a function can be implemented
that reads the value of a parameter from file. The function
performs the following actions:
</p>
<ol>
<li> It opens file \"fileName\" and reads the lines of the file.</li>
<li> In every line, Modelica line comments (\"// ... end-of-line\")
     are skipped </li>
<li> If a line consists of \"name = expression\" and the \"name\"
     in this line is identical to the second argument \"name\"
     of the function call, the expression calculator Examples.expression
     is used to evaluate the expression after the \"=\" character.
     The expression can optionally be terminated with a \";\".</li>
<li> The result of the expression evaluation is returned as
     the value of the parameter \"name\". </li>
</ol>
<h4>Example</h4>
<p>
On file \"test.txt\" the following lines might be present:
</p>
<blockquote><pre>
// Motor data
J        = 2.3     // inertia
w_rel0   = 1.5*2;  // relative angular velocity
phi_rel0 = pi/3
</pre></blockquote>
<p>
The function returns the value \"3.0\" when called as:
</p>
<blockquote><pre>
readRealParameter(\"test.txt\", \"w_rel0\")
</pre></blockquote>
</html>"));
    end readIntegerParameter;

    function integerExpression
      "Expression interpreter that returns with the position after the expression (expression may consist of +,-,*,/,(),sin(), cos(), tan(), sqrt(), pi"
      import Modelica.Utilities.Types;
      import Modelica.Utilities.Strings;
      import Modelica.Math;
      import Modelica.Constants;

      extends Modelica.Icons.Function;
      input String string "Expression that is evaluated";
      input Integer startIndex=1
        "Start scanning of expression at character startIndex";
      input String message=""
        "Message used in error message if scan is not successful";
      output Integer result "Value of expression";
      output Integer nextIndex "Index after the scanned expression";

    protected
    function term "Evaluate term of an expression"
      extends Modelica.Icons.Function;
      input String string;
      input Integer startIndex;
      input String message="";
      output Real result;
      output Integer nextIndex;
      protected
      Integer result2;
      Boolean scanning=true;
      String opString;
    algorithm
      // scan for "primary * primary" or "primary / primary"
      (result, nextIndex) := primary(string, startIndex, message);
      while scanning loop
        (opString, nextIndex) := Strings.scanDelimiter(
                                        string, nextIndex, {"*","/",""}, message);
        if opString == "" then
           scanning := false;
        else
           (result2, nextIndex) := primary(string, nextIndex, message);
           result := if opString == "*" then result*result2 else result/result2;
        end if;
      end while;
    end term;

    function primary "Evaluate primary of an expression"
      extends Modelica.Icons.Function;

      input String string;
      input Integer startIndex;
      input String message="";
      output Real result;
      output Integer nextIndex;
      protected
      Types.TokenValue token;
      Real result2;
      String delimiter;
      String functionName;
      Real pi = Modelica.Constants.pi;
    algorithm
      (token,nextIndex) := Strings.scanToken(string, startIndex,unsigned=true);
      if token.tokenType == Types.TokenType.DelimiterToken and token.string == "(" then
        (result,nextIndex) := expression(string, nextIndex,message);
        (delimiter,nextIndex) := Strings.scanDelimiter(string,nextIndex,{")"}, message);

      elseif token.tokenType == Types.TokenType.RealToken then
        result := token.real;

      elseif token.tokenType == Types.TokenType.IntegerToken then
        result := token.integer;

      elseif token.tokenType == Types.TokenType.IdentifierToken then
        if token.string == "pi" then
           result := pi;
        else
           functionName := token.string;
           (delimiter,nextIndex) := Strings.scanDelimiter(string,nextIndex,{"("}, message);
           (result,nextIndex)    := expression(string, nextIndex, message);
           (delimiter,nextIndex) := Strings.scanDelimiter(string,nextIndex,{")"}, message);
           if functionName == "sin" then
             result := Math.sin(result);
           elseif functionName == "cos" then
             result := Math.cos(result);
           elseif functionName == "tan" then
             result := Math.tan(result);
           elseif functionName == "sqrt" then
             if result < 0.0 then
                Strings.syntaxError(string, startIndex, "Argument of call \"sqrt(" + String(result) + ")\" is negative.\n" +
                            "Imaginary numbers are not supported by the calculator.\n" + message);
             end if;
             result := sqrt(result);
           else
             Strings.syntaxError(string, startIndex, "Function \"" + functionName + "\" is unknown (not supported)\n" +
                                             message);
           end if;
        end if;

      else
        Strings.syntaxError(string, startIndex, "Invalid primary of expression.\n" + message);
      end if;
    end primary;

      Integer result2;
      String signOfNumber;
      Boolean scanning=true;
      String opString;
    algorithm
      // scan for optional leading "+" or "-" sign
      (signOfNumber, nextIndex) :=Modelica.Utilities.Strings.scanDelimiter(
                                       string, startIndex, {"+","-",""}, message);

      // scan for "term + term" or "term - term"
      (result, nextIndex) := WaterHeaterLib.BaseClasses.integerTerm(string, nextIndex, message);
      if signOfNumber == "-" then
         result := -result;
      end if;

      while scanning loop
        (opString, nextIndex) := Modelica.Utilities.Strings.scanDelimiter(
                                        string, nextIndex, {"+","-",""}, message);
        if opString == "" then
           scanning := false;
        else
           (result2, nextIndex) := WaterHeaterLib.BaseClasses.integerTerm(string, nextIndex, message);
           result := if opString == "+" then result+result2 else result-result2;
        end if;
      end while;

      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
             result = <b>expression</b>(string);
(result, nextIndex) = <b>expression</b>(string, startIndex=1, message=\"\");
</pre></blockquote>
<h4>Description</h4>
<p>
This function is nearly the same as Examples.<b>calculator</b>.
The essential difference is that function \"expression\" might be
used in other parsing operations: After the expression is
parsed and evaluated, the function returns with the value
of the expression as well as the position of the character
directly after the expression.
</p>
<p>
This function demonstrates how a simple expression calculator
can be implemented in form of a recursive decent parser
using basically the Strings.scanToken(..) and scanDelimiters(..)
function. There are 2 local functions (term, primary) that
implement the corresponding part of the grammar.
</p>
<p>
The following operations are supported (pi=3.14.. is a predefined constant):
</p>
<pre>
   +, -
   *, /
   (expression)
   sin(expression)
   cos(expression)
   tan(expression)
   sqrt(expression)
   pi
</pre>
<p>
The optional argument \"startIndex\" defines at which position
scanning of the expression starts.
</p>
<p>
In case of error,
the optional argument \"message\" is appended to the error
message, in order to give additional information where
the error occured.
</p>
<p>
This function parses the following grammaer
</p>
<pre>
  expression: [ add_op ] term { add_op term }
  add_op    : \"+\" | \"-\"
  term      : primary { mul_op primary }
  mul_op    : \"*\" | \"/\"
  primary   : UNSIGNED_NUMBER
              | pi
              | ( expression )
              | functionName( expression )
  function  :   sin
              | cos
              | tan
              | sqrt
</pre>
<p>
Note, in Examples.readRealParameter it is shown, how the expression
function can be used as part of another scan operation.
</p>
<h4>Example</h4>
<blockquote><pre>
  expression(\"2+3*(4-1)\");  // returns 11
  expression(\"sin(pi/6)\");  // returns 0.5
</pre></blockquote>
</html>"));
    end integerExpression;

    function integerTerm
      extends Modelica.Icons.Function;
      input String string;
      input Integer startIndex;
      input String message="";
      output Integer result;
      output Integer nextIndex;
    protected
      Integer result2;
      Boolean scanning=true;
      String opString;
    algorithm
      // scan for "primary * primary" or "primary / primary"
      (result, nextIndex) := WaterHeaterLib.BaseClasses.integerPrimary(string, startIndex, message);
      while scanning loop
        (opString, nextIndex) := Modelica.Utilities.Strings.scanDelimiter(
                                        string, nextIndex, {"*","/",""}, message);
        if opString == "" then
           scanning := false;
        else
           (result2, nextIndex) := WaterHeaterLib.BaseClasses.integerPrimary(string, nextIndex, message);
           result :=result2; // if opString == "*" then result*result2 else result/result2;
        end if;
      end while;
    end integerTerm;

    function integerPrimary
      extends Modelica.Icons.Function;

      input String string;
      input Integer startIndex;
      input String message="";
      output Integer result;
      output Integer nextIndex;
    protected
      Modelica.Utilities.Types.TokenValue token;
      Integer result2;
      String delimiter;
      String functionName;
      Real pi = Modelica.Constants.pi;
    algorithm
      (token,nextIndex) := Modelica.Utilities.Strings.scanToken(string, startIndex,unsigned=true);
      if token.tokenType == Modelica.Utilities.Types.TokenType.DelimiterToken and token.string == "(" then
        (result,nextIndex) := WaterHeaterLib.BaseClasses.integerExpression(string, nextIndex,message);
        (delimiter,nextIndex) := Modelica.Utilities.Strings.scanDelimiter(string,nextIndex,{")"}, message);

    //  elseif token.tokenType == Modelica.Utilities.Types.TokenType.RealToken then
    //    result := token.real;

      elseif token.tokenType == Modelica.Utilities.Types.TokenType.IntegerToken then
        result := token.integer;

    //  elseif token.tokenType == Modelica.Utilities.Types.TokenType.IdentifierToken then
    //    if token.string == "pi" then
    //       result := pi;
    //    else
    //       functionName := token.string;
    //       (delimiter,nextIndex) := Modelica.Utilities.Strings.scanDelimiter(string,nextIndex,{"("}, message);
    //       (result,nextIndex)    := WaterHeaterLib.BaseClasses.integerExpression(string, nextIndex, message);
    //       (delimiter,nextIndex) := Modelica.Utilities.Strings.scanDelimiter(string,nextIndex,{")"}, message);
    //       if functionName == "sin" then
    //         result := Modelica.Math.sin(result);
    //       elseif functionName == "cos" then
    //         result := Modelica.Math.cos(result);
    //       elseif functionName == "tan" then
    //         result := Modelica.Math.tan(result);
    //       elseif functionName == "sqrt" then
    //         if result < 0.0 then
    //            Modelica.Utilities.Strings.syntaxError(string, startIndex, "Argument of call \"sqrt(" + String(result) + ")\" is negative.\n" +
    //                        "Imaginary numbers are not supported by the calculator.\n" + message);
    //         end if;
    //         result := sqrt(result);
    //       else
    //         Modelica.Utilities.Strings.syntaxError(string, startIndex, "Function \"" + functionName + "\" is unknown (not supported)\n" +
    //                                         message);
    //       end if;
    //    end if;

      else
        Modelica.Utilities.Strings.syntaxError(string, startIndex, "Invalid primary of expression.\n" + message);
      end if;
    end integerPrimary;

    model timDel
      "Calculates the time delay for each segment at the given flow rate"
      extends Modelica.Blocks.Interfaces.BlockIcon;

      parameter Integer nSeg(min = 1) = 1;
      parameter Real timDelA[nSeg] = {0};
      parameter Real timDelB[nSeg] = {0};
      parameter Real timDelC[nSeg] = {0};

      Modelica.Blocks.Sources.RealExpression realExpression[nSeg](y=timDelA)
        annotation (Placement(transformation(extent={{-70,36},{-50,56}})));
      Modelica.Blocks.Sources.RealExpression realExpression1[nSeg](y=timDelB)
        annotation (Placement(transformation(extent={{-70,4},{-50,24}})));
      Modelica.Blocks.Sources.RealExpression realExpression2[nSeg](y=timDelC)
        annotation (Placement(transformation(extent={{-70,-26},{-50,-6}})));
      Modelica.Blocks.Math.Product product1[nSeg]
        annotation (Placement(transformation(extent={{-30,64},{-10,84}})));
      Modelica.Blocks.Math.Product product2[nSeg]
        annotation (Placement(transformation(extent={{2,42},{22,62}})));
      Modelica.Blocks.Math.Product product3[nSeg]
        annotation (Placement(transformation(extent={{0,10},{20,30}})));
      Modelica.Blocks.Math.Add3 add3_1[nSeg]
        annotation (Placement(transformation(extent={{64,10},{84,30}})));
      Modelica.Blocks.Interfaces.RealInput m_flow_in[nSeg]
        annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
      Modelica.Blocks.Interfaces.RealOutput y[nSeg]
        annotation (Placement(transformation(extent={{100,10},{120,30}})));
    equation
      connect(m_flow_in,product1. u1) annotation (Line(
          points={{-120,80},{-32,80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(m_flow_in,product1. u2) annotation (Line(
          points={{-120,80},{-58,80},{-58,68},{-32,68}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y,product2. u1) annotation (Line(
          points={{-9,74},{-6,74},{-6,58},{0,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression.y,product2. u2) annotation (Line(
          points={{-49,46},{0,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product2.y,add3_1. u1) annotation (Line(
          points={{23,52},{46,52},{46,28},{62,28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(m_flow_in,product3. u1) annotation (Line(
          points={{-120,80},{-86,80},{-86,26},{-2,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression1.y,product3. u2) annotation (Line(
          points={{-49,14},{-2,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product3.y,add3_1. u2) annotation (Line(
          points={{21,20},{62,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(realExpression2.y,add3_1. u3) annotation (Line(
          points={{-49,-16},{48,-16},{48,12},{62,12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add3_1.y,y)  annotation (Line(
          points={{85,20},{110,20}},
          color={0,0,127},
          smooth=Smooth.None));
    end timDel;

    model perFloIn
      "Calculates the percentage of inlet water entering a segment for a given flow rate and time"
      extends Modelica.Blocks.Interfaces.BlockIcon;

      parameter Integer nSeg(min=2) = 10;

      Modelica.Blocks.Interfaces.RealInput minFloIn[nSeg]
        annotation (Placement(transformation(extent={{-140,60},{-100,100}})));

      Modelica.Blocks.Interfaces.IntegerInput Active[nSeg]
        annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
      Modelica.Blocks.Interfaces.RealOutput perFlo[nSeg]
        annotation (Placement(transformation(extent={{100,0},{120,20}})));
    equation

      for i in (1:nSeg) loop
        perFlo[i] = minFloIn[i] * Active[i];
      end for;

    end perFloIn;

    model QEle "Describes the electricity consumption of the unit"
      extends Modelica.Blocks.Interfaces.BlockIcon;

      parameter Real QEleIdl = 5
        "Electricity consumption when the burner is idle";
      parameter Real QEleAct = 150
        "Electricity consumption when the burner is active";
      Modelica.Blocks.Interfaces.RealInput BurnerStatus
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
      Modelica.Blocks.Sources.Constant Act(k=QEleAct)
        annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
      Modelica.Blocks.Sources.Constant Idl(k=QEleIdl)
        annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
      Modelica.Blocks.Math.Product product
        annotation (Placement(transformation(extent={{-44,-16},{-24,4}})));
      Modelica.Blocks.Math.Max max
        annotation (Placement(transformation(extent={{8,-10},{28,10}})));
      Modelica.Blocks.Interfaces.RealOutput QEle
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
    equation
      connect(BurnerStatus, product.u1) annotation (Line(
          points={{-120,0},{-46,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Act.y, product.u2) annotation (Line(
          points={{-59,-30},{-54,-30},{-54,-12},{-46,-12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y, max.u2) annotation (Line(
          points={{-23,-6},{6,-6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Idl.y, max.u1) annotation (Line(
          points={{-59,50},{-14,50},{-14,6},{6,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(max.y, QEle) annotation (Line(
          points={{29,0},{110,0}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(graphics));
    end QEle;

    model TimeBasedIfGain
      "A gain model which contains an if-statement to yield different values depending on the time"
      extends Modelica.Blocks.Interfaces.BlockIcon;

      parameter Real TimeLow;
      parameter Real TimeHigh;
      parameter Real InIfGain;
      parameter Real OutIfGain;
      Modelica.Blocks.Interfaces.RealInput u
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
      Modelica.Blocks.Interfaces.RealOutput y
        annotation (Placement(transformation(extent={{100,-10},{124,14}})));

      Modelica.Blocks.Sources.RealExpression Time(y=time)
        annotation (Placement(transformation(extent={{-68,32},{-48,52}})));
    equation
      if Time.y < TimeLow then
        y = OutIfGain * u;
      elseif Time.y > TimeHigh then
        y = OutIfGain * u;
      else
        y = 0;
      end if;

    end TimeBasedIfGain;

    model buoHeaTraMod
      "Modified buoHeaTra. Changed so that all inputs are single values instead of arrays"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;

      parameter Integer nSeg(min=2) = 2;

      parameter Real QDotPilot;

      Modelica.Blocks.Interfaces.RealInput QDotBas
        annotation (Placement(transformation(extent={{-140,-120},{-100,-80}})));
      Modelica.Blocks.Interfaces.RealInput QDotFlu
        annotation (Placement(transformation(extent={{-140,-40},{-100,0}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a TWat[nSeg]
        annotation (Placement(transformation(extent={{-116,26},{-96,46}})));
      Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor WatT[nSeg]
        annotation (Placement(transformation(extent={{-96,26},{-76,46}})));
      Modelica.Blocks.Interfaces.RealOutput buoHeaTra[nSeg]
        annotation (Placement(transformation(extent={{100,-6},{132,26}})));
      WaterHeaterLib.BaseClasses.strLay
            strLay(nSeg=nSeg, QDotPilot=QDotPilot)
                              annotation (Placement(transformation(extent={{-66,26},
                {-46,46}})));
      heaSum heaSum1(nSeg=nSeg)
        annotation (Placement(transformation(extent={{-36,-14},{-16,6}})));
      QIn qIn(nSeg=nSeg)
              annotation (Placement(transformation(extent={{20,-54},{40,-34}})));
      Modelica.Blocks.Interfaces.RealInput QLosTop
        annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
    equation

      connect(TWat, WatT.port) annotation (Line(
          points={{-106,36},{-96,36}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(WatT.T, strLay.TWat) annotation (Line(
          points={{-76,36},{-68,36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(strLay.strLay, heaSum1.strLay) annotation (Line(
          points={{-44.4,36},{-42,36},{-42,0},{-38,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QDotFlu, heaSum1.QDotFlu) annotation (Line(
          points={{-120,-20},{-80,-20},{-80,-8},{-38,-8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QDotBas, heaSum1.QDotBas) annotation (Line(
          points={{-120,-100},{-60,-100},{-60,-14},{-38,-14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(strLay.strLay, qIn.strLay) annotation (Line(
          points={{-44.4,36},{0,36},{0,-38},{18,-38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(heaSum1.QBelStrTot, qIn.heaBelStrTot) annotation (Line(
          points={{-15,-4},{-8,-4},{-8,-42},{18,-42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QDotFlu, qIn.QDotFlu) annotation (Line(
          points={{-120,-20},{-20,-20},{-20,-50},{18,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QDotBas, qIn.QDotBas) annotation (Line(
          points={{-120,-100},{-20,-100},{-20,-54},{18,-54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(qIn.QInCom, buoHeaTra) annotation (Line(
          points={{41,-44},{78,-44},{78,10},{116,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(WatT.T, qIn.TWat) annotation (Line(
          points={{-76,36},{-76,-46},{18,-46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QLosTop, heaSum1.QLosTop) annotation (Line(
          points={{-120,80},{-38,80},{-38,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(QLosTop, qIn.QLosTop) annotation (Line(
          points={{-120,80},{4,80},{4,-34},{18,-34}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}),
                          graphics), Icon(coordinateSystem(preserveAspectRatio=true,
              extent={{-100,-100},{100,100}})));
    end buoHeaTraMod;
  end BaseClasses;

  annotation (
    uses(Modelica(version="3.2"), Buildings(version="1.2")),
    version="1",
    conversion(noneFromVersion=""));
  package StorageTankModels "Provides different models of storage tanks"
  end StorageTankModels;
end WaterHeaterLib;
