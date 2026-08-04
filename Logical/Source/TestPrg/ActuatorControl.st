
FUNCTION_BLOCK FB_ActuatorControl

xSensorConflict := i_xSenRetracted AND i_xSenExtended;

q_xExtended  := i_xSenExtended AND NOT i_xSenRetracted;
q_xRetracted := i_xSenRetracted AND NOT i_xSenExtended;
q_xMoving    := (i_xCmdExtend AND NOT q_xExtended) OR (NOT i_xCmdExtend AND NOT q_xRetracted);

fbTimeout(IN := q_xMoving AND NOT xErrorLatch, PT := i_tMoveTimeout);

IF xSensorConflict OR fbTimeout.Q THEN
	xErrorLatch := TRUE;
ELSIF i_xErrorAck THEN
	xErrorLatch := FALSE;
END_IF;

q_xError  := xErrorLatch;
q_xOutput := i_xCmdExtend AND NOT q_xError;

END_FUNCTION_BLOCK
