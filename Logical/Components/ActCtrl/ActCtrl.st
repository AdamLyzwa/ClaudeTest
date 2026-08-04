
FUNCTION_BLOCK ActCtrl

SensorConflict := SensorRetracted AND SensorExtended;

Sts.Extended := SensorExtended AND NOT SensorRetracted;
Sts.Retracted := SensorRetracted AND NOT SensorExtended;
Sts.Moving := (Cmd.Extend AND NOT Sts.Extended) OR (NOT Cmd.Extend AND NOT Sts.Retracted);

fbTimeout(IN := Sts.Moving AND NOT ErrorLatch, PT := Par.MoveTimeout);

IF SensorConflict OR fbTimeout.Q THEN
	ErrorLatch := TRUE;
ELSIF Cmd.ErrorAcknowledge THEN
	ErrorLatch := FALSE;
END_IF;

Sts.Error := ErrorLatch;
Sts.Output := Cmd.Extend AND NOT Sts.Error;

END_FUNCTION_BLOCK
