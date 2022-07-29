global function CreateHealthBar
global function DestroyHealthBar

struct {
	var cockpitRui
	entity observed
} file

void function CreateHealthBar( int handle )
{
	entity observed = GetEntityFromEncodedEHandle( handle )
	entity player = GetLocalViewPlayer()

	file.cockpitRui = CreateTitanCockpitRui( $"ui/ajax_cockpit_base.rpak" )
	RuiTrackFloat3( file.cockpitRui, "playerOrigin", player, RUI_TRACK_ABSORIGIN_FOLLOW )
	RuiTrackFloat3( file.cockpitRui, "playerEyeAngles", player, RUI_TRACK_EYEANGLES_FOLLOW )
	RuiTrackFloat( file.cockpitRui, "healthFrac", observed, RUI_TRACK_HEALTH )
	// RuiTrackFloat( file.cockpitRui, "shieldFrac", player, RUI_TRACK_SHIELD_FRACTION )
	RuiSetFloat( file.cockpitRui, "ejectManualTimeOut", EJECT_FADE_TIME )

	float health = observed.GetMaxHealth().tofloat()
	float healthPerSegment = 100.0
	RuiSetInt( file.cockpitRui, "numHealthSegments", int( health / healthPerSegment ) )
}

void function DestroyHealthBar()
{
	if( file.cockpitRui )
		RuiDestroyIfAlive( file.cockpitRui )
}