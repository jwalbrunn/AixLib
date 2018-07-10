within AixLib.Building.Benchmark;
model Weather
  Components.Weather.Weather weather(
    Wind_dir=true,
    Wind_speed=true,
    Air_temp=true,
    Mass_frac=false,
    Rel_hum=false,
    SOD=DataBase.Weather.SurfaceOrientation.SurfaceOrientationData_N_E_S_W_Hor(),
    Air_press=false,
    fileName=
        "D:/aku-bga/AixLib/AixLib/Resources/weatherdata/TRY2010_12_Jahr_Modelica-Library.txt")
    annotation (Placement(transformation(extent={{-50,14},{-20,34}})));
  Utilities.Interfaces.SolarRad_out solarRad_out_North
    annotation (Placement(transformation(extent={{-96,70},{-116,90}})));
  Utilities.Interfaces.SolarRad_out solarRad_out_East
    annotation (Placement(transformation(extent={{-96,30},{-116,50}})));
  Utilities.Interfaces.SolarRad_out solarRad_out_South
    annotation (Placement(transformation(extent={{-96,-10},{-116,10}})));
  Utilities.Interfaces.SolarRad_out solarRad_out_West
    annotation (Placement(transformation(extent={{-96,-50},{-116,-30}})));
  Utilities.Interfaces.SolarRad_out solarRad_out_Hor
    annotation (Placement(transformation(extent={{-96,-90},{-116,-70}})));
  Modelica.Blocks.Interfaces.RealOutput WindSpeed_East "in m/s"
    annotation (Placement(transformation(extent={{90,30},{110,50}})));
  Modelica.Blocks.Interfaces.RealOutput WindSpeed_South "in m/s"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealOutput WindSpeed_West "in m/s"
    annotation (Placement(transformation(extent={{90,-50},{110,-30}})));
  Modelica.Blocks.Interfaces.RealOutput WindSpeed_North "in m/s"
    annotation (Placement(transformation(extent={{90,70},{110,90}})));
  Modelica.Blocks.Math.Gain gain(k=1/360)
    annotation (Placement(transformation(extent={{10,36},{20,46}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{68,76},{76,84}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{68,36},{76,44}})));
  Modelica.Blocks.Math.Product product2
    annotation (Placement(transformation(extent={{68,-4},{76,4}})));
  Modelica.Blocks.Math.Product product3
    annotation (Placement(transformation(extent={{68,-44},{76,-36}})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D(table=[0,1; 0.25,1; 0.26,0;
        0.74,0; 0.75,1; 1,1], smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments)
    annotation (Placement(transformation(extent={{46,62},{56,72}})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D1(table=[0,1; 0.25,1; 0.5,1;
        0.51,0; 0.99,0; 1,1])
    annotation (Placement(transformation(extent={{46,22},{56,32}})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D2(table=[0,0; 0.24,0; 0.25,1;
        0.75,1; 0.76,0; 1,0])
    annotation (Placement(transformation(extent={{46,-18},{56,-8}})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D3(table=[0,1; 0.01,0; 0.49,0;
        0.5,1; 1,1])
    annotation (Placement(transformation(extent={{46,-58},{56,-48}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
    prescribedTemperature annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-14})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b AirTemp
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  Modelica.Blocks.Interfaces.RealOutput WindSpeed_Hor "in m/s"
    annotation (Placement(transformation(extent={{90,-90},{110,-70}})));
  Modelica.Blocks.Math.Gain gain1(k=0)
    annotation (Placement(transformation(extent={{52,-86},{64,-74}})));
equation
  connect(solarRad_out_South, solarRad_out_South)
    annotation (Line(points={{-106,0},{-106,0}}, color={255,128,0}));
  connect(solarRad_out_North, weather.SolarRadiation_OrientedSurfaces[1])
    annotation (Line(points={{-106,80},{-80,80},{-80,0},{-42.8,0},{-42.8,13}},
        color={255,128,0}));
  connect(solarRad_out_East, weather.SolarRadiation_OrientedSurfaces[2])
    annotation (Line(points={{-106,40},{-80,40},{-80,0},{-42.8,0},{-42.8,13}},
        color={255,128,0}));
  connect(solarRad_out_South, weather.SolarRadiation_OrientedSurfaces[3])
    annotation (Line(points={{-106,0},{-42.8,0},{-42.8,13}}, color={255,128,0}));
  connect(solarRad_out_West, weather.SolarRadiation_OrientedSurfaces[4])
    annotation (Line(points={{-106,-40},{-80,-40},{-80,0},{-42.8,0},{-42.8,13}},
        color={255,128,0}));
  connect(solarRad_out_Hor, weather.SolarRadiation_OrientedSurfaces[5])
    annotation (Line(points={{-106,-80},{-80,-80},{-80,0},{-42.8,0},{-42.8,13}},
        color={255,128,0}));
  connect(weather.WindDirection, gain.u)
    annotation (Line(points={{-19,33},{0,33},{0,41},{9,41}}, color={0,0,127}));
  connect(weather.WindSpeed, product1.u1) annotation (Line(points={{-19,30},{40,
          30},{40,42.4},{67.2,42.4}}, color={0,0,127}));
  connect(product.u1, product1.u1) annotation (Line(points={{67.2,82.4},{40,
          82.4},{40,42.4},{67.2,42.4}}, color={0,0,127}));
  connect(product2.u1, product1.u1) annotation (Line(points={{67.2,2.4},{40,2.4},
          {40,42.4},{67.2,42.4}},        color={0,0,127}));
  connect(product3.u1, product1.u1) annotation (Line(points={{67.2,-37.6},{40,
          -37.6},{40,42.4},{67.2,42.4}}, color={0,0,127}));
  connect(gain.y, combiTable1D.u[1]) annotation (Line(points={{20.5,41},{32.25,
          41},{32.25,67},{45,67}}, color={0,0,127}));
  connect(combiTable1D.y[1], product.u2) annotation (Line(points={{56.5,67},{
          62.25,67},{62.25,77.6},{67.2,77.6}}, color={0,0,127}));
  connect(combiTable1D1.u[1], gain.y) annotation (Line(points={{45,27},{32,27},
          {32,41},{20.5,41}},color={0,0,127}));
  connect(combiTable1D2.u[1], gain.y) annotation (Line(points={{45,-13},{32,-13},
          {32,41},{20.5,41}}, color={0,0,127}));
  connect(combiTable1D3.u[1], gain.y) annotation (Line(points={{45,-53},{32,-53},
          {32,41},{20.5,41}}, color={0,0,127}));
  connect(combiTable1D1.y[1], product1.u2) annotation (Line(points={{56.5,27},{
          62,27},{62,37.6},{67.2,37.6}},color={0,0,127}));
  connect(combiTable1D2.y[1], product2.u2) annotation (Line(points={{56.5,-13},
          {62,-13},{62,-2.4},{67.2,-2.4}},   color={0,0,127}));
  connect(combiTable1D3.y[1], product3.u2) annotation (Line(points={{56.5,-53},
          {62,-53},{62,-42.4},{67.2,-42.4}}, color={0,0,127}));
  connect(product1.y, WindSpeed_East)
    annotation (Line(points={{76.4,40},{100,40}}, color={0,0,127}));
  connect(product2.y, WindSpeed_South)
    annotation (Line(points={{76.4,0},{100,0}},     color={0,0,127}));
  connect(product3.y, WindSpeed_West)
    annotation (Line(points={{76.4,-40},{100,-40}}, color={0,0,127}));
  connect(product.y, WindSpeed_North)
    annotation (Line(points={{76.4,80},{100,80}}, color={0,0,127}));
  connect(weather.AirTemp, prescribedTemperature.T) annotation (Line(points={{
          -19,27},{2.22045e-015,27},{2.22045e-015,-2}}, color={0,0,127}));
  connect(prescribedTemperature.port, AirTemp)
    annotation (Line(points={{0,-24},{0,-100}}, color={191,0,0}));
  connect(gain1.y, WindSpeed_Hor)
    annotation (Line(points={{64.6,-80},{100,-80}}, color={0,0,127}));
  connect(gain1.u, product1.u1) annotation (Line(points={{50.8,-80},{40,-80},{
          40,42.4},{67.2,42.4}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Weather;
