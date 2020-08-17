within AixLib.ThermalZones.HighOrder.Validation.ASHRAE140.BaseClasses;
block CheckResultsAccordingToASHRAE
  extends Modelica.Blocks.Icons.Block;
  parameter Real endTime        "Simulation end time";

  Modelica.Blocks.Interfaces.RealInput upperLimit
                                                 "maximum Value"
    annotation (Placement(transformation(extent={{-140,16},{-100,56}}),
        iconTransformation(extent={{-128,26},{-100,54}})));

  Modelica.Blocks.Interfaces.RealInput modelResults
    annotation (Placement(transformation(extent={{-140,-84},{-100,-44}}),
        iconTransformation(extent={{-128,-72},{-100,-44}})));
  Modelica.Blocks.Interfaces.RealInput lowerLimit
                                                 "minimum Value"
    annotation (Placement(transformation(extent={{-140,54},{-100,94}}),
        iconTransformation(extent={{-128,66},{-100,94}})));

  Modelica.Blocks.Interfaces.BooleanOutput satisfied annotation (Placement(transformation(
          extent={{100,-20},{140,20}}),iconTransformation(extent={{100,-14},{128,
            14}})));

initial equation
  satisfied = false;

equation
    when time >= endTime then
      satisfied =  modelResults >= lowerLimit and modelResults <= upperLimit;
    end when;

 annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(revisions="<html><ul>
  <li>
    <i>July 1, 2020</i> by Konstantina Xanthopoulou:<br/>
    Implemented
  </li>
</ul>
</html>", info="<html>
<p>
  Block to test AnnualHeatingLoad and AnnualCoolingLoad according to
  reference Validation Data.
</p>
</html>"));
end CheckResultsAccordingToASHRAE;