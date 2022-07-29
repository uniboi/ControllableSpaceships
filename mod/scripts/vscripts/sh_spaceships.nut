#if CLIENT
global function Server_SetSpaceshipHealthBar
#endif

global function Spaceship_Network

void function Spaceship_Network()
{
	AddCallback_OnRegisteringCustomNetworkVars( RegisterNetworkVars )
}

void function RegisterNetworkVars()
{
	Remote_RegisterFunction( "CreateHealthBar" )
	Remote_RegisterFunction( "DestroyHealthBar" )
	Remote_RegisterFunction( "Server_SetSpaceshipHealthBar" )
}

#if CLIENT
void function Server_SetSpaceshipHealthBar( int health )
{
	printt("test", health)
}
#endif