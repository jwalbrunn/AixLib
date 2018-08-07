within AixLib.Building.Benchmark.Transfer.Transfer_RLT;
model RLT
  replaceable package Medium_Water =
    AixLib.Media.Water "Medium in the component";
  replaceable package Medium_Air =
    AixLib.Media.Air "Medium in the component";

    parameter Modelica.SIunits.Velocity v_nominal = 0 annotation(Dialog(tab = "General"));
    parameter Real m_flow_nominal = 0 annotation(Dialog(tab = "General"));
    parameter Modelica.SIunits.Length pipe_length = 0 annotation(Dialog(tab = "General"));
    parameter Modelica.SIunits.Length pipe_wall_thickness = 0 annotation(Dialog(tab = "General"));
    parameter Modelica.SIunits.Length pipe_insulation_thickness = 0 annotation(Dialog(tab = "General"));
    parameter Modelica.SIunits.Length pipe_insulation_conductivity = 0.02 annotation(Dialog(tab = "General"));
  Fluid.HeatExchangers.ConstantEffectiveness Ext_Warm(
    m1_flow_nominal=1,
    m2_flow_nominal=10,
    dp1_nominal=10,
    dp2_nominal=10,
    redeclare package Medium1 = Medium_Water,
    redeclare package Medium2 = Medium_Air)
    annotation (Placement(transformation(extent={{-52,-70},{-72,-50}})));
  Fluid.HeatExchangers.ConstantEffectiveness Ext_Cold(
    m1_flow_nominal=1,
    m2_flow_nominal=10,
    dp1_nominal=10,
    dp2_nominal=10,
    redeclare package Medium1 = Medium_Water,
    redeclare package Medium2 = Medium_Air)
    annotation (Placement(transformation(extent={{28,-70},{8,-50}})));
  Fluid.Humidifiers.SprayAirWasher_X hum(
    m_flow_nominal=20,
    dp_nominal=20,
    redeclare package Medium = Medium_Air)
    annotation (Placement(transformation(extent={{62,-76},{82,-56}})));
  Modelica.Fluid.Interfaces.FluidPort_a Fluid_in_cold(redeclare package Medium =
        Medium_Water)
    "Fluid connector a1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{70,90},{90,110}})));
  Modelica.Fluid.Interfaces.FluidPort_b Fluid_out_cold(redeclare package Medium =
        Medium_Water)
    "Fluid connector b1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{30,90},{50,110}})));
  Modelica.Fluid.Interfaces.FluidPort_a Fluid_in_warm(redeclare package Medium =
        Medium_Water)
    "Fluid connector a1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{-50,90},{-30,110}})));
  Modelica.Fluid.Interfaces.FluidPort_b Fluid_out_warm(redeclare package Medium =
        Medium_Water)
    "Fluid connector b1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{-90,90},{-70,110}})));
  Modelica.Fluid.Interfaces.FluidPort_a Air_in(redeclare package Medium =
        Medium_Air)
    "Fluid connector a2 (positive design flow direction is from port_a2 to port_b2)"
    annotation (Placement(transformation(extent={{-108,-76},{-88,-56}})));
  Modelica.Fluid.Interfaces.FluidPort_b Air_out(redeclare package Medium =
        Medium_Air)
    "Fluid connector b (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{90,-76},{110,-56}})));
  Modelica.Blocks.Interfaces.RealInput X_w1
    "Set point for water vapor mass fraction in kg/kg total air of the fluid that leaves port_b"
    annotation (Placement(transformation(
        extent={{20,-20},{-20,20}},
        rotation=90,
        origin={0,100})));
  Fluid.Movers.SpeedControlled_y fan
    annotation (Placement(transformation(extent={{-96,-22},{-76,-2}})));
  Fluid.FixedResistances.PlugFlowPipe plugFlowPipe(redeclare package Medium =
        Medium_Water,
    length=pipe_length,
    cPip=500,
    rhoPip=8000,
    thickness=pipe_wall_thickness,
    v_nominal=v_nominal,
    m_flow_nominal=m_flow_nominal,
    dIns=pipe_insulation_thickness,
    kIns=pipe_insulation_conductivity)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-82,44})));
  Fluid.Actuators.Valves.ThreeWayLinear val1
    annotation (Placement(transformation(extent={{-156,-44},{-136,-24}})));
equation
  connect(Ext_Warm.port_b2, Ext_Cold.port_a2)
    annotation (Line(points={{-52,-66},{8,-66}}, color={0,127,255}));
  connect(Ext_Cold.port_b2, hum.port_a)
    annotation (Line(points={{28,-66},{62,-66}}, color={0,127,255}));
  connect(Ext_Cold.port_a1, Fluid_in_cold)
    annotation (Line(points={{28,-54},{80,-54},{80,100}}, color={0,127,255}));
  connect(Ext_Cold.port_b1, Fluid_out_cold) annotation (Line(points={{8,-54},{0,
          -54},{0,80},{40,80},{40,100}},   color={0,127,255}));
  connect(Ext_Warm.port_a2, Air_in)
    annotation (Line(points={{-72,-66},{-98,-66}}, color={0,127,255}));
  connect(hum.port_b, Air_out)
    annotation (Line(points={{82,-66},{100,-66}}, color={0,127,255}));
  connect(hum.X_w, X_w1) annotation (Line(points={{60,-60},{40,-60},{40,-40},{0,
          -40},{0,100}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end RLT;
