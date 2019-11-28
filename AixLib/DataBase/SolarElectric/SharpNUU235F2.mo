within AixLib.DataBase.SolarElectric;
record SharpNUU235F2
   extends AixLib.DataBase.SolarElectric.PVBaseRecordNew(
   n_ser=60,
   n_par=1,
   A_cel=((V_mp0*I_mp0)/(1000*eta_0))/n_ser,
   A_mod=0.994*1.640,
   eta_0=0.144,
   V_oc0=37,
   I_sc0=8.6,
   V_mp0=30,
   I_mp0=7.84,
   TCoeff_Isc=0.00053*8.6,
   TCoeff_Voc=-0.00351*37,
   gamma_Pmp=-0.000485,
   T_NOCT=47.5+273.15);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end SharpNUU235F2;