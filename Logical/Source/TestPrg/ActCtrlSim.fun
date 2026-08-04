
FUNCTION_BLOCK ActCtrlSim
VAR_INPUT
	Output     : BOOL;              (* wysterowanie z ActCtrl.Output: TRUE = wysuń, FALSE = cofnij *)
	TravelTime : TIME := T#2S;      (* symulowany czas przejazdu siłownika między pozycjami krańcowymi *)
END_VAR
VAR_OUTPUT
	SensorRetracted : BOOL;  (* symulowany Signal1 *)
	SensorExtended  : BOOL;  (* symulowany Signal2 *)
END_VAR
VAR
	fbExtendTravel  : TON;
	fbRetractTravel : TON;
END_VAR
END_FUNCTION_BLOCK
