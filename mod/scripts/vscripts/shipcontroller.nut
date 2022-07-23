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

	PrecacheModel($"models/vehicle/straton/straton_imc_gunship_01.mdl")
	PrecacheModel($"models/vehicle/crow_dropship/crow_dropship_hero.mdl")
	PrecacheModel($"models/vehicle/goblin_dropship/goblin_dropship_hero.mdl")
	PrecacheModel($"models/vehicle/escape_pod/escape_pod.mdl")
	// PrecacheModel($"models/vehicle/straton/straton_imc_gunship_01.mdl" // hornet
	// PrecacheModel($"models/vehicle/capital_ship_annapolis/annapolis.mdl")
	// PrecacheModel($"models/vehicle/capital_ship_Birmingham/birmingham_fleetScale.mdl")
	// PrecacheModel($"models/vehicle/imc_bomber/bomber.mdl")
	PrecacheModel($"models/vehicle/draconis/vehicle_draconis_hero_animated.mdl")
	// PrecacheModel($"models/vehicle/imc_carrier/vehicle_imc_carrier207_stage1.mdl")
	// PrecacheModel($"models/vehicle/imc_carrier/vehicle_imc_carrier.mdl")
	// PrecacheModel($"models/vehicle/redeye/redeye2.mdl")
	PrecacheModel($"models/vehicle/widow/widow.mdl")
}

// Spawn a new spaceship where the player is looking at
bool function SpawnShipForPlayer( entity player, array<string> args )
{
	string type = "straton"
	if ( args.len() )
		type = args[0]	

	TraceResults r = GetViewTrace( player )

	var s = Spaceship( type, r.endPos )
	return true
}