within AixLib.ThermalZones.HighOrder.Validation.ASHRAE140;
model Case230
  extends AixLib.ThermalZones.HighOrder.Validation.ASHRAE140.Case220(
    airExchange=0.822,
    ReferenceHeatingLoad(table=[230,10376,12243]),
    ReferenceCoolingLoad(table=[230,-1139,-454]));
  annotation (Documentation(revisions="<html><ul>
  <li>
    <i>July 1, 2020</i> by Konstantina Xanthopoulou:<br/>
    Implemented
  </li>
</ul>
</html>", info="<html>
<p>
  As described in ASHRAE Standard 140.
</p>
<p>
  Difference to case 220:
</p>
<ul>
  <li>Air Exchange Rate = 0.822
  </li>
</ul>
</html>"));
end Case230;