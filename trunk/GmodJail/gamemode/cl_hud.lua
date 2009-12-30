--Made By Cake Master
--Edited by Dorkslayz
function cake_hud()
	local client = LocalPlayer()
	if !client:Alive() then return end
	if(client:GetActiveWeapon() == NULL or client:GetActiveWeapon() == "Camera") then return end
	draw.RoundedBox(3, 5, 5, 200, 25, Color(51, 58, 51, 255))
	draw.SimpleText(client:Health() .. "%", "ScoreboardText", 95, 8, Color(86, 104, 86, 255), 0, 0)
	local mag_left = client:GetActiveWeapon():Clip1()
	local mag_extra = client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType())
	local secondary_ammo = client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType())
end
hook.Add("HUDPaint", "cake_hud", cake_hud)
function hidehud(name)
	for k, v in pairs{"CHudHealth", "CHudAmmo", "CHudSecondaryAmmo"} do
		if name == v then return false end
	end
end
hook.Add("HUDShouldDraw", "hidehud", hidehud)