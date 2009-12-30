--Coded by Dorkslayz
--Edited by Cake Master

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_hud.lua" )

include( 'shared.lua' )


// Serverside only stuff goes here

/*---------------------------------------------------------
   Name: gamemode:PlayerLoadout( )
   Desc: Give the player the default spawning weapons/ammo
---------------------------------------------------------*/
function GM:PlayerSpawn( ply )
		ply:SetGravity( 1 )
		ply:SetMaxHealth( 125, true )
		ply:SetWalkSpeed( 325 )
				ply:SetRunSpeed( 325 )
end
function GM:PlayerLoadout( ply )

if ply:Team() == TEAM_GUARD then
        ply:StripWeapons()	 
 
		 ply:Give( "weapon_deagle" )
		 ply:Give( "weapon_m4" )
		 
elseif ply:Team() == TEAM_PRISONER then
		ply:StripWeapons()
 
		 ply:Give( "weapon_crowbar" )

end

 function GM:PlayerInitialSpawn ( ply )
if ply:IsAdmin() then 
ply:PrintMessage( HUD_PRINTTALK, "GmodJail: Hello Admin,Hope you have a nice stay!")
end
end
end

	 function GM:ShowHelp( ply )
ply:SendLua( "jail_main()")
end

local function DisableNoclip( objPl )
	return objPl:IsAdmin()
end
hook.Add("PlayerNoClip", "DisableNoclip", DisableNoclip)

function GM:PlayerNoClip( pl )
	pl:PrintMessage(HUD_PRINTTALK, "You can't Noclip.")
	return false
end

 function TEAM_GUARD( ply ) 
 
     ply:SetTeam( TEAM_GUARD )
	 ply:SetModel( "models/Humans/NYPD/male_01.mdl" )
	 ply:Spawn()
 end 
			
 function TEAM_PRISONER( ply ) 
 
     ply:SetTeam( TEAM_PRISONER )
	 ply:SetModel( "models/Human/Group02/Male_02.mdl" )
	 ply:Spawn()
 end 			
				
 concommand.Add( "TEAM_GUARD", TEAM_GUARD )
 concommand.Add( "TEAM_PRISONER", TEAM_PRISONER )