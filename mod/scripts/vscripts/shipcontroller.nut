untyped // bad practice and makes life harder but needed because I chose to rewrite with classes (why did I do that)

global function ShipControllerInit

struct {
	table< entity, entity > ships
	entity shipMover
	entity ship
} file

void function ShipControllerInit()
{
	AddClientCommandCallback( "ship", SpawnShipForPlayer )
}

// Spawn a new spaceship where the player is looking at
bool function SpawnShipForPlayer( entity player, array<string> args )
{
	string type = "straton"
	if ( args.len() )
		type = args[0]	

	TraceResults r = GetViewTrace( player )

	var s = Spaceship( type, r.endPos )
	if( r.hitEnt )
	s.mover.SetParent( r.hitEnt )
	return true
}