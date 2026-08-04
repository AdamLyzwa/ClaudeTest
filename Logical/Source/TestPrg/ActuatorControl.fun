
FUNCTION_BLOCK FB_ActuatorControl
VAR_INPUT
	i_xCmdExtend    : BOOL;              (* TRUE = wysuń, FALSE = cofnij *)
	i_xSenRetracted : BOOL;              (* Signal1 - czujnik pozycji cofniętej *)
	i_xSenExtended  : BOOL;              (* Signal2 - czujnik pozycji wysuniętej *)
	i_xErrorAck     : BOOL;              (* kasowanie błędu *)
	i_tMoveTimeout  : TIME := T#5S;      (* maks. czas ruchu do pozycji docelowej *)
END_VAR
VAR_OUTPUT
	q_xOutput    : BOOL;  (* wyjście cyfrowe do siłownika: TRUE = wysuń, FALSE = cofnij *)
	q_xExtended  : BOOL;  (* siłownik w pozycji wysuniętej *)
	q_xRetracted : BOOL;  (* siłownik w pozycji cofniętej *)
	q_xMoving    : BOOL;  (* siłownik w ruchu, pozycja docelowa jeszcze nie osiągnięta *)
	q_xError     : BOOL;  (* konflikt czujników lub przekroczony czas ruchu *)
END_VAR
VAR
	fbTimeout      : TON;
	xErrorLatch    : BOOL;
	xSensorConflict: BOOL;
END_VAR
END_FUNCTION_BLOCK
