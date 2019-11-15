within AixLib.Utilities.MassTransfer;
model Convection
  "Lumped element for mass convection (m_flow = Gc*dX)"
  Modelica.SIunits.MassFlowRate m_flow "Mass flow rate from solid -> fluid";
  Modelica.SIunits.MassFraction dX "= solid.X - fluid.X";
  Modelica.Blocks.Interfaces.RealInput Gc(unit="kg/s")
    "Signal representing the convective mass transfer coefficient in [kg/s]"
    annotation (Placement(transformation(
        origin={0,100},
        extent={{-20,-20},{20,20}},
        rotation=270)));
  MassPort solid
    annotation (Placement(transformation(extent={{-118,-18},{-82,18}})));
  MassPort fluid
    annotation (Placement(transformation(extent={{84,-16},{116,16}})));
equation
  dX = solid.X - fluid.X;
  solid.m_flow = m_flow;
  fluid.m_flow = -m_flow;
  m_flow = Gc*dX;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={
        Rectangle(
          extent={{-62,80},{98,-80}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-90,80},{-60,-80}},
          fillColor={192,192,192},
          fillPattern=FillPattern.Backward),
        Text(
          extent={{-150,-90},{150,-130}},
          textString="%name",
          lineColor={0,0,255}),
        Line(points={{100,0},{100,0}}, color={0,127,255}),
        Line(points={{-60,20},{76,20}}, color={0,140,72}),
        Line(points={{-60,-20},{76,-20}}, color={0,140,72}),
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
        Line(points={{56,-30},{76,-20}}, color={0,140,72}),
        Line(points={{56,-10},{76,-20}}, color={0,140,72}),
        Line(points={{56,10},{76,20}}, color={0,140,72}),
        Line(points={{56,30},{76,20}}, color={0,140,72}),
        Text(
          extent={{22,124},{92,98}},
          textString="Gc")}),
    Documentation(info="<html>
<p>
This is a model of linear heat convection, e.g., the heat transfer between a plate and the surrounding air; see also:
<a href=\"modelica://Modelica.Thermal.HeatTransfer.Components.ConvectiveResistor\">ConvectiveResistor</a>.
It may be used for complicated solid geometries and fluid flow over the solid by determining the
convective thermal conductance Gc by measurements. The basic constitutive equation for convection is
</p>
<pre>
   Q_flow = Gc*(solid.T - fluid.T);
   Q_flow: Heat flow rate from connector 'solid' (e.g., a plate)
      to connector 'fluid' (e.g., the surrounding air)
</pre>
<p>
Gc = G.signal[1] is an input signal to the component, since Gc is
nearly never constant in practice. For example, Gc may be a function
of the speed of a cooling fan. For simple situations,
Gc may be <em>calculated</em> according to
</p>
<pre>
   Gc = A*h
   A: Convection area (e.g., perimeter*length of a box)
   h: Heat transfer coefficient
</pre>
<p>
where the heat transfer coefficient h is calculated
from properties of the fluid flowing over the solid. Examples:
</p>
<p>
<strong>Machines cooled by air</strong> (empirical, very rough approximation according
to R. Fischer: Elektrische Maschinen, 10th edition, Hanser-Verlag 1999,
p. 378):
</p>
<pre>
    h = 7.8*v^0.78 [W/(m2.K)] (forced convection)
      = 12         [W/(m2.K)] (free convection)
    where
      v: Air velocity in [m/s]
</pre>
<p><strong>Laminar</strong> flow with constant velocity of a fluid along a
<strong>flat plate</strong> where the heat flow rate from the plate
to the fluid (= solid.Q_flow) is kept constant
(according to J.P.Holman: Heat Transfer, 8th edition,
McGraw-Hill, 1997, p.270):
</p>
<pre>
   h  = Nu*k/x;
   Nu = 0.453*Re^(1/2)*Pr^(1/3);
   where
      h  : Heat transfer coefficient
      Nu : = h*x/k       (Nusselt number)
      Re : = v*x*rho/mue (Reynolds number)
      Pr : = cp*mue/k    (Prandtl number)
      v  : Absolute velocity of fluid
      x  : distance from leading edge of flat plate
      rho: density of fluid (material constant
      mue: dynamic viscosity of fluid (material constant)
      cp : specific heat capacity of fluid (material constant)
      k  : thermal conductivity of fluid (material constant)
   and the equation for h holds, provided
      Re &lt; 5e5 and 0.6 &lt; Pr &lt; 50
</pre>
</html>"),
       Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(
          extent={{-90,80},{-60,-80}},
          fillColor={192,192,192},
          fillPattern=FillPattern.Backward),
        Line(points={{100,0},{100,0}}, color={0,127,255}),
        Line(points={{100,0},{100,0}}, color={0,127,255}),
        Line(points={{100,0},{100,0}}, color={0,127,255}),
        Text(
          extent={{-40,40},{80,20}},
          lineColor={0,140,72},
          textString="m_flow"),
        Line(points={{-60,20},{76,20}}, color={0,140,72}),
        Line(points={{-60,-20},{76,-20}}, color={0,140,72}),
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
        Line(points={{56,-30},{76,-20}}, color={0,140,72}),
        Line(points={{56,-10},{76,-20}}, color={0,140,72}),
        Line(points={{56,10},{76,20}}, color={0,140,72}),
        Line(points={{56,30},{76,20}}, color={0,140,72})}));
end Convection;