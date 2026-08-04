
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	fbActuator(
		i_xCmdExtend    := xCmdExtend,
		i_xSenRetracted := xSignal1,
		i_xSenExtended  := xSignal2,
		i_xErrorAck     := xErrorAck
	);
	xActuatorOutput := fbActuator.q_xOutput;
	xActuatorError  := fbActuator.q_xError;
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

