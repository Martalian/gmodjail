--Coded By Dorkslayz
--Edited By Cake Master
GM.Name 	= "Dorkslayz, Cake Master"
GM.Author 	= "N/A"
GM.Email 	= "N/A"
GM.Website 	= "N/A"

DeriveGamemode( "sandbox" )

TEAM_GUARD = 1
TEAM_PRISONER = 2
TEAM_SPECTATOR = 3

team.SetUp( TEAM_GUARD, "Guard", Color( 122, 122, 122, 255 ) ) 
team.SetUp( TEAM_PRISONER, "Prisoner", Color( 0, 0, 0, 255 ) ) 
team.SetUp( TEAM_SPECTATOR, "Spectator", Color( 225, 0, 0, 255 ) ) 

function GM:Initialize()

	self.BaseClass.Initialize( self )
	
end

 function GM:PlayerNoClip( pl, on )
	
if ( pl:IsAdmin() ) then return true end
	
	return false
	
end