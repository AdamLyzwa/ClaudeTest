
TYPE
	ActCtrlCmdType : STRUCT
		Extend           : BOOL;  (* TRUE = wysuń, FALSE = cofnij *)
		ErrorAcknowledge : BOOL;  (* kasowanie błędu *)
	END_STRUCT;
	ActCtrlParType : STRUCT
		MoveTimeout : TIME := T#5S;  (* maks. czas ruchu do pozycji docelowej *)
	END_STRUCT;
	ActCtrlStsType : STRUCT
		Output    : BOOL;  (* wyjście cyfrowe do siłownika: TRUE = wysuń, FALSE = cofnij *)
		Extended  : BOOL;  (* siłownik w pozycji wysuniętej *)
		Retracted : BOOL;  (* siłownik w pozycji cofniętej *)
		Moving    : BOOL;  (* siłownik w ruchu, pozycja docelowa jeszcze nie osiągnięta *)
		Error     : BOOL;  (* konflikt czujników lub przekroczony czas ruchu *)
	END_STRUCT;
END_TYPE
