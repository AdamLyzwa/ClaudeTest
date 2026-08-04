
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	(* symulacja czujników pozycji na podstawie wysterowania z ActCtrl - tylko do testów w ARsim *)
	fbActCtrlSim(Output := fbActCtrl.Sts.Output);

	fbActCtrl(
		SensorRetracted := fbActCtrlSim.SensorRetracted,
		SensorExtended  := fbActCtrlSim.SensorExtended
	);
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

