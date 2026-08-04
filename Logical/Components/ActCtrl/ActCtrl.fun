
FUNCTION_BLOCK ActCtrl
VAR_INPUT
	Cmd             : ActCtrlCmdType;
	Par             : ActCtrlParType;
	SensorRetracted : BOOL;  (* czujnik pozycji cofniętej *)
	SensorExtended  : BOOL;  (* czujnik pozycji wysuniętej *)
END_VAR
VAR_OUTPUT
	Sts : ActCtrlStsType;
END_VAR
VAR
	fbTimeout      : TON;
	ErrorLatch     : BOOL;
	SensorConflict : BOOL;
END_VAR
END_FUNCTION_BLOCK
