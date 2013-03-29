within ;
model NonCondensingTanklessHXController
  "Control Module for Non-Condensing Tankless Water Heaters"
  Modelica.Blocks.Sources.RealExpression mdot_min
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Sources.RealExpression Qdot_min
    annotation (Placement(transformation(extent={{-38,16},{-18,36}})));
  Modelica.Blocks.Sources.RealExpression T_Set
    annotation (Placement(transformation(extent={{-100,-66},{-80,-46}})));
  Modelica.Blocks.Interfaces.RealInput mdot_water
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput T_out
    annotation (Placement(transformation(extent={{-140,-94},{-100,-54}})));
  Modelica.Blocks.Sources.RealExpression SpecificHeat
    annotation (Placement(transformation(extent={{-100,26},{-80,46}})));
  Modelica.Blocks.Sources.RealExpression T_Inlet
    annotation (Placement(transformation(extent={{-100,10},{-80,30}})));
  Modelica.Blocks.Math.Add add(k1=-1, k2=+1)
    annotation (Placement(transformation(extent={{-74,4},{-54,24}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{-68,44},{-48,64}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{-36,38},{-16,58}})));
  Modelica.Blocks.Logical.OnOffController MinFlowCheck
    annotation (Placement(transformation(extent={{-50,70},{-30,90}})));
  Modelica.Blocks.Logical.OnOffController MinHeatRateCheck
    annotation (Placement(transformation(extent={{-6,32},{14,52}})));
  Modelica.Blocks.Interfaces.RealOutput mdot_water_controlled
    annotation (Placement(transformation(extent={{100,44},{130,74}})));
  Modelica.Blocks.Interfaces.RealOutput ControlConstant annotation (Placement(
        transformation(extent={{100,-74},{128,-46}}), iconTransformation(extent
          ={{100,-74},{128,-46}})));
equation
  connect(T_Inlet.y, add.u1) annotation (Line(
      points={{-79,20},{-76,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_Set.y, add.u2) annotation (Line(
      points={{-79,-56},{-76,-56},{-76,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mdot_water, product.u1) annotation (Line(
      points={{-120,60},{-70,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SpecificHeat.y, product.u2) annotation (Line(
      points={{-79,36},{-76,36},{-76,48},{-70,48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product.y, product1.u1) annotation (Line(
      points={{-47,54},{-38,54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, product1.u2) annotation (Line(
      points={{-53,14},{-46,14},{-46,42},{-38,42}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mdot_water, MinFlowCheck.u) annotation (Line(
      points={{-120,60},{-86,60},{-86,74},{-52,74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mdot_min.y, MinFlowCheck.reference) annotation (Line(
      points={{-79,90},{-66,90},{-66,86},{-52,86}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product1.y, MinHeatRateCheck.reference) annotation (Line(
      points={{-15,48},{-8,48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Qdot_min.y, MinHeatRateCheck.u) annotation (Line(
      points={{-17,26},{-14,26},{-14,36},{-8,36}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    uses(Modelica(version="3.2")),
    Diagram(graphics),
    Icon(graphics={Bitmap(extent={{-100,96},{100,-98}}, fileName=
              "//vmware-host/Shared Folders/Downloads/ControlModule.jpg")}));
end NonCondensingTanklessHXController;
