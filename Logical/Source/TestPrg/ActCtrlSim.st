
FUNCTION_BLOCK ActCtrlSim

fbExtendTravel(IN := Output, PT := TravelTime);
fbRetractTravel(IN := NOT Output, PT := TravelTime);

SensorExtended := fbExtendTravel.Q;
SensorRetracted := fbRetractTravel.Q;

END_FUNCTION_BLOCK
