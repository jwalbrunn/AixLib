within AixLib.ThermalZones.HighOrder.Rooms.OFD;
model Ow2IwL2IwS1Lf1At1Ro1
  "2 outer walls, 2 inner walls load, 1 inner wall simple, 1 floor towards lower floor, 1 ceiling towards attic, 1 roof towards outside"

  extends AixLib.ThermalZones.HighOrder.Rooms.OFD.BaseClasses.PartialRoom(redeclare DataBase.Walls.Collections.OFD.BaseDataMultiInnerWalls wallTypes,
    final room_V=room_length*room_width_long*
      room_height_long - room_length*(room_width_long - room_width_short)*(
      room_height_long - room_height_short)*0.5);


  //////////room geometry
  parameter Modelica.SIunits.Length room_length=2 "length "
    annotation (Dialog(group="Dimensions", descriptionLabel=true));
  parameter Modelica.SIunits.Length room_lengthb=2 "length_b "
    annotation (Dialog(group="Dimensions", descriptionLabel=true));
  parameter Modelica.SIunits.Length room_width_long=2 "w1 "
    annotation (Dialog(group="Dimensions", descriptionLabel=true));
  parameter Modelica.SIunits.Length room_width_short=2 "w2 "
    annotation (Dialog(group="Dimensions", descriptionLabel=true));
  parameter Modelica.SIunits.Height room_height_long=2 "h1 "
    annotation (Dialog(group="Dimensions", descriptionLabel=true));
  parameter Modelica.SIunits.Height room_height_short=2 "h2 "
    annotation (Dialog(group="Dimensions", descriptionLabel=true));
  parameter Modelica.SIunits.Length roof_width=2 "wRO"
    annotation (Dialog(group="Dimensions", descriptionLabel=true));


  parameter Real solar_absorptance_RO=0.25 "Solar absoptance roof "
    annotation (Dialog(group="Outer wall properties", descriptionLabel=true));

  // Windows and Doors
  parameter Boolean withWindow2=true "Window 2" annotation (Dialog(
      group="Windows and Doors",
      joinNext=true,
      descriptionLabel=true), choices(checkBox=true));
  parameter Modelica.SIunits.Area windowarea_OW2=0 "Window area " annotation (
      Dialog(
      group="Windows and Doors",
      descriptionLabel=true,
      enable=withWindow2));
  parameter Boolean withWindow3=true "Window 3 " annotation (Dialog(
      group="Windows and Doors",
      joinNext=true,
      descriptionLabel=true), choices(checkBox=true));
  parameter Modelica.SIunits.Area windowarea_RO=0 "Window area" annotation (
      Dialog(
      group="Windows and Doors",
      naturalWidth=10,
      descriptionLabel=true,
      enable=withWindow3));
  parameter Boolean withDoor2=true "Door 2" annotation (Dialog(
      group="Windows and Doors",
      joinNext=true,
      descriptionLabel=true), choices(checkBox=true));
  parameter Modelica.SIunits.Length door_width_OD2=0 "width " annotation (
      Dialog(
      group="Windows and Doors",
      joinNext=true,
      descriptionLabel=true,
      enable=withDoor2));
  parameter Modelica.SIunits.Length door_height_OD2=0 "height " annotation (
      Dialog(
      group="Windows and Doors",
      descriptionLabel=true,
      enable=withDoor2));
  parameter Real eps_door_OD2=0.95 "eps" annotation (Dialog(
      group="Windows and Doors",
      descriptionLabel=true,
      enable=withDoor2));
  parameter Real U_door_OD2=2.5 "U-value" annotation (
     Dialog(
      group="Windows and Doors",
      joinNext=true,
      descriptionLabel=true,
      enable=withDoor2));

  AixLib.ThermalZones.HighOrder.Components.Walls.Wall outside_wall1(
    solar_absorptance=solar_absorptance_OW,
    final T0=TWalls_start,
    wall_length=room_length,
    wall_height=room_height_short,
    withWindow=false,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    windowarea=0,
    withDoor=false,
    door_height=0,
    door_width=0,
    wallPar=wallTypes.OW)
                     annotation (Placement(transformation(extent={{-88,-24},{-78,32}})));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall outside_wall2(
    solar_absorptance=solar_absorptance_OW,
    calcMethodOut=1,
    hConOut_const=hConOut_const,
    surfaceType=surfaceType,
    windowarea=windowarea_OW2,
    final T0=TWalls_start,
    door_height=door_height_OD2,
    door_width=door_width_OD2,
    withWindow=withWindow2,
    withDoor=withDoor2,
    wall_length=room_width_long,
    wall_height=0.5*(room_height_long + room_height_short + room_width_short/room_width_long*(room_height_long - room_height_short)),
    wallPar=wallTypes.OW,
    WindowType=Type_Win,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    U_door=U_door_OD2,
    eps_door=eps_door_OD2) annotation (Placement(transformation(
        origin={-25,58},
        extent={{-6,-33},{6,33}},
        rotation=270)));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall inside_wall1a(
    final T0=TWalls_start,
    outside=false,
    wallPar=wallTypes.IW2_vert_half_a,
    wall_length=room_length - room_lengthb,
    wall_height=room_height_long,
    withWindow=false,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    withDoor=false) annotation (Placement(transformation(
        origin={60,19},
        extent={{-2,-15},{2,15}},
        rotation=180)));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall inside_wall2(
    final T0=TWalls_start,
    outside=false,
    wallPar=wallTypes.IW_vert_half_a,
    wall_length=room_width_long,
    wall_height=0.5*(room_height_long + room_height_short + room_width_short/room_width_long*(room_height_long - room_height_short)),
    withWindow=false,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    withDoor=false) annotation (Placement(transformation(
        origin={28,-60},
        extent={{-4.00002,-26},{4.00001,26}},
        rotation=90)));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall Ceiling(
    final T0=TWalls_start,
    outside=false,
    wallPar=wallTypes.IW_hori_att_low_half,
    wall_length=room_length,
    wall_height=room_width_short,
    withWindow=false,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    withDoor=false,
    ISOrientation=3) annotation (Placement(transformation(
        origin={28,60},
        extent={{1.99999,-10},{-1.99998,10}},
        rotation=90)));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall floor(
    final T0=TWalls_start,
    outside=false,
    wallPar=wallTypes.IW_hori_upp_half,
    wall_length=room_length,
    wall_height=room_width_long,
    withWindow=false,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    withDoor=false,
    ISOrientation=2)                              annotation (Placement(transformation(
        origin={-24,-60},
        extent={{-1.99999,-10},{1.99999,10}},
        rotation=90)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thermInsideWall2
    annotation (Placement(transformation(extent={{20,-100},{40,-80}}),
        iconTransformation(extent={{20,-100},{40,-80}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thermInsideWall1a
    annotation (Placement(transformation(extent={{80,0},{100,20}})));
  Utilities.Interfaces.SolarRad_in SolarRadiationPort_OW1
    annotation (Placement(transformation(extent={{-119.5,20},{-99.5,40}}), iconTransformation(extent={{-109.5,20},{-89.5,40}})));
  Utilities.Interfaces.SolarRad_in SolarRadiationPort_OW2 annotation (Placement(
        transformation(
        origin={44.5,101},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thermCeiling
    annotation (Placement(transformation(extent={{80,40},{100,60}})));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall roof(
    final T0=TWalls_start,
    solar_absorptance=solar_absorptance_RO,
    wall_length=room_length,
    withDoor=false,
    door_height=0,
    door_width=0,
    wall_height=roof_width,
    withWindow=withWindow3,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    windowarea=windowarea_RO,
    wallPar=wallTypes.roof,
    WindowType=Type_Win) annotation (Placement(transformation(
        origin={59,59},
        extent={{-3.00001,-17},{3.00002,17}},
        rotation=270)));
  Utilities.Interfaces.SolarRad_in SolarRadiationPort_Roof annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={74,100})));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall inside_wall1b(
    final T0=TWalls_start,
    outside=false,
    wallPar=wallTypes.IW2_vert_half_a,
    wall_length=room_lengthb,
    wall_height=room_height_long,
    withWindow=false,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    withDoor=false) annotation (Placement(transformation(
        origin={60,-19},
        extent={{-2,-15},{2,15}},
        rotation=180)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thermInsideWall1b
    annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thermFloor annotation (
      Placement(transformation(extent={{-16,-104},{4,-84}}), iconTransformation(
          extent={{-16,-104},{4,-84}})));
  Modelica.Blocks.Interfaces.RealInput WindSpeedPort
    annotation (Placement(transformation(extent={{-126,40},{-99.5,66}}), iconTransformation(extent={{-109.5,-60},{-89.5,-40}})));




equation
  connect(outside_wall1.SolarRadiationPort, SolarRadiationPort_OW1) annotation (
     Line(points={{-89.5,29.6667},{-86,29.6667},{-86,30},{-109.5,30}},color={0,0,
          0}));
  connect(inside_wall2.port_outside, thermInsideWall2)
    annotation (Line(points={{28,-64.2},{28,-90},{30,-90}}, color={191,0,0}));
  connect(thermInsideWall2, thermInsideWall2)
    annotation (Line(points={{30,-90},{30,-90}}, color={191,0,0}));
  connect(inside_wall1b.port_outside, thermInsideWall1b)
    annotation (Line(points={{62.1,-19},{90,-19},{90,-30}}, color={191,0,0}));
  connect(inside_wall1a.port_outside, thermInsideWall1a) annotation (Line(
        points={{62.1,19},{84,19},{84,20},{90,20},{90,10}}, color={191,0,0}));
  connect(roof.SolarRadiationPort, SolarRadiationPort_Roof) annotation (Line(
        points={{74.5833,62.9},{74.5833,92},{74,92},{74,100}}, color={255,128,0}));
  connect(Ceiling.port_outside, thermCeiling) annotation (Line(points={{28,62.1},{28,62.1},{28,74},{90,74},{90,50}},
                                              color={191,0,0}));
  connect(outside_wall2.SolarRadiationPort, SolarRadiationPort_OW2) annotation (
     Line(points={{5.25,65.8},{5.25,74},{44.5,74},{44.5,101}}, color={255,128,0}));
  connect(thermFloor, floor.port_outside) annotation (Line(points={{-6,-94},{-8,-94},{-8,-70},{-24,-70},{-24,-62.1}}, color={191,0,0}));
  connect(outside_wall2.thermStarComb_inside, thermStar_Demux.portConvRadComb) annotation (Line(points={{-25,52},{-25,40},{40,40},{40,-40},{-7,-40},{-7,-8}},          color={191,0,0}));
  connect(roof.thermStarComb_inside, thermStar_Demux.portConvRadComb) annotation (Line(points={{59,56},{59,40},{40,40},{40,-40},{-7,-40},{-7,-8}},          color={191,0,0}));
  connect(Ceiling.thermStarComb_inside, thermStar_Demux.portConvRadComb) annotation (Line(points={{28,58},{28,40},{40,40},{40,-40},{-7,-40},{-7,-8}},          color={191,0,0}));
  connect(inside_wall1b.thermStarComb_inside, thermStar_Demux.portConvRadComb) annotation (Line(points={{58,-19},{40,-19},{40,-40},{-7,-40},{-7,-8}},          color={191,0,0}));
  connect(inside_wall1a.thermStarComb_inside, thermStar_Demux.portConvRadComb) annotation (Line(points={{58,19},{40,19},{40,-40},{-7,-40},{-7,-8}},          color={191,0,0}));
  connect(inside_wall2.thermStarComb_inside, thermStar_Demux.portConvRadComb) annotation (Line(points={{28,-56},{28,-40},{-6,-40},{-6,-8},{-7,-8}},              color={191,0,0}));
  connect(outside_wall1.thermStarComb_inside, thermStar_Demux.portConvRadComb) annotation (Line(points={{-78,4},{-74,4},{-74,-40},{-7,-40},{-7,-8}},            color={191,0,0}));
  connect(WindSpeedPort, outside_wall1.WindSpeedPort) annotation (Line(points={{-112.75,53},{-96,53},{-96,24.5333},{-88.25,24.5333}}, color={0,0,127}));
  connect(WindSpeedPort, roof.WindSpeedPort) annotation (Line(points={{-112.75,53},{-96,53},{-96,70},{71.4667,70},{71.4667,62.15}}, color={0,0,127}));
  connect(WindSpeedPort, outside_wall2.WindSpeedPort) annotation (Line(points={{-112.75,53},{-96,53},{-96,70},{-0.8,70},{-0.8,64.3}}, color={0,0,127}));
  connect(floor.thermStarComb_inside, thermStar_Demux.portConvRadComb) annotation (Line(points={{-24,-58},{-24,-48},{-7,-48},{-7,-8}},              color={191,0,0}));
  connect(outside_wall1.port_outside, thermOutside) annotation (Line(points={{-88.25,4},{-94,4},{-94,100},{-100,100}}, color={191,0,0}));
  connect(outside_wall2.port_outside, thermOutside) annotation (Line(points={{-25,64.3},{-25,100},{-100,100}}, color={191,0,0}));
  connect(roof.port_outside, thermOutside) annotation (Line(points={{59,62.15},{59,76},{-25,76},{-25,100},{-100,100}}, color={191,0,0}));
  annotation (Icon(graphics={
        Rectangle(
          extent={{-80,80},{80,60}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{0,80},{-50,60}},
          lineColor={0,0,0},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          visible=withWindow2),
        Rectangle(
          extent={{80,60},{68,-68}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-80,60},{-60,-80}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,-68},{80,-80}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{80,60},{68,8}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-80,30},{-60,-20}},
          lineColor={0,0,0},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          visible=withWindow3),
        Rectangle(
          extent={{-60,60},{68,-68}},
          lineColor={0,0,0},
          fillColor={47,102,173},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-56,52},{64,40}},
          lineColor={255,255,255},
          fillColor={255,170,170},
          fillPattern=FillPattern.Solid,
          textString="width"),
        Line(points={{38,46},{68,46}}, color={255,255,255}),
        Line(points={{-46,60},{-46,30}}, color={255,255,255}),
        Line(points={{-60,46},{-30,46}}, color={255,255,255}),
        Text(
          extent={{-120,6},{0,-6}},
          lineColor={255,255,255},
          fillColor={255,170,170},
          fillPattern=FillPattern.Solid,
          origin={-46,56},
          rotation=90,
          textString="length"),
        Line(points={{-46,-42},{-46,-68}}, color={255,255,255}),
        Rectangle(
          extent={{20,80},{40,60}},
          lineColor={0,0,0},
          fillColor={127,127,0},
          fillPattern=FillPattern.Solid,
          visible=withDoor2),
        Text(
          extent={{-50,76},{0,64}},
          lineColor={255,255,255},
          fillColor={255,170,170},
          fillPattern=FillPattern.Solid,
          textString="Win2",
          visible=withWindow2),
        Text(
          extent={{-25,6},{25,-6}},
          lineColor={255,255,255},
          fillColor={255,170,170},
          fillPattern=FillPattern.Solid,
          textString="Win3",
          origin={-70,5},
          rotation=90,
          visible=withWindow3),
        Text(
          extent={{20,74},{40,66}},
          lineColor={255,255,255},
          fillColor={255,170,170},
          fillPattern=FillPattern.Solid,
          textString="D2",
          visible=withDoor2),
        Line(points={{68,8},{54,8}}, color={255,255,255}),
        Line(points={{58,8},{58,0}}, color={255,255,255}),
        Text(
          extent={{50,6},{-50,-6}},
          lineColor={255,255,255},
          fillColor={255,170,170},
          fillPattern=FillPattern.Solid,
          origin={58,-30},
          rotation=90,
          textString="length_b"),
        Line(points={{58,-62},{58,-68}}, color={255,255,255})}), Documentation(
        revisions="<html>
 <ul>
 <li><i>April 18, 2014</i> by Ana Constantin:<br/>Added documentation</li>
 <li><i>July 8, 2011</i> by Ana Constantin:<br/>Implemented</li>
 </ul>
 </html>", info="<html>
 <h4><span style=\"color:#008000\">Overview</span></h4>
 <p>Model for a room with 2&nbsp;outer&nbsp;walls,&nbsp;2&nbsp;inner&nbsp;walls&nbsp;load towards two different rooms but with the same orientation,&nbsp;1&nbsp;inner&nbsp;wall&nbsp;simple,&nbsp;1&nbsp;floor&nbsp;towards&nbsp;lower&nbsp;floor,&nbsp;1&nbsp;ceiling&nbsp;towards&nbsp;attic,&nbsp;1&nbsp;roof&nbsp;towards&nbsp;outside.</p>
 <h4><span style=\"color:#008000\">Concept</span></h4>
 <p>The following figure presents the room&apos;s layout:</p>
 <p><img src=\"modelica://AixLib/Resources/Images/Building/HighOrder/OW2_2IWl_1IWs_1Pa_1At1Ro.png\"
    alt=\"Room layout\"/></p>
 </html>"));
end Ow2IwL2IwS1Lf1At1Ro1;
