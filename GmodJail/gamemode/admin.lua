--Made by Cake Master
--Edited by Dorkslayz

function adminmenu(caller)

if not caller:IsAdmin() then return end

local AdminMenu = vgui.Create("DFrame")
AdminMenu:SetPos((ScrW() / 2) - 150, (ScrH() / 2) - 250)
AdminMenu:SetSize(300, 400)
AdminMenu:SetTitle("Admin Menu")
AdminMenu:SetVisible(true)
AdminMenu:SetDraggable(true)
AdminMenu:ShowCloseButton(true)
AdminMenu:MakePopup()

local PlayerList = vgui.Create("DListView")
PlayerList:SetParent(AdminMenu)
PlayerList:SetPos(10, 160)
PlayerList:SetSize(80, 150)
PlayerList:SetMultiSelect(false)
PlayerList:AddColumn("Name")
PlayerList:SetMultiSelect(true)

BannedPlayerList = vgui.Create("DListView")
BannedPlayerList:SetParent(AdminMenu)
BannedPlayerList:SetPos(110, 160)
BannedPlayerList:SetSize(180, 150)
BannedPlayerList:SetMultiSelect(false)
BannedPlayerList:AddColumn("ID")
BannedPlayerList:SetMultiSelect(true)

local ReasonBox = vgui.Create("DTextEntry", AdminMenu)
ReasonBox:SetPos(10, 50)
ReasonBox:SetSize(80, 20)

local IDBox = vgui.Create("DTextEntry", AdminMenu)
IDBox:SetPos(160, 50)
IDBox:SetSize(80, 20)

local KickButton = vgui.Create("DButton", AdminMenu)
KickButton:SetPos(10, 80)
KickButton:SetSize(80, 20)
KickButton:SetText("Kick Player")

local BanButton = vgui.Create("DButton", AdminMenu)
BanButton:SetPos(10, 110)
BanButton:SetSize(80, 20)
BanButton:SetText("Ban Player")

local UnbanIDButton = vgui.Create("DButton", AdminMenu)
UnbanIDButton:SetPos(160, 80)
UnbanIDButton:SetSize(80, 20)
UnbanIDButton:SetText("Unban ID")

local UnbanButton = vgui.Create("DButton", AdminMenu)
UnbanButton:SetPos(160, 110)
UnbanButton:SetSize(80, 20)
UnbanButton:SetText("Unban Player")

local ReasonLabel= vgui.Create("DLabel", AdminMenu)
ReasonLabel:SetPos(30, 30)
ReasonLabel:SetText("Reason")
ReasonLabel:SizeToContents()

local IDLabel= vgui.Create("DLabel", AdminMenu)
IDLabel:SetPos(160, 30)
IDLabel:SetText("End of SteamID")
IDLabel:SizeToContents()

local BannedLabel = vgui.Create("DLabel", AdminMenu)
BannedLabel:SetPos(150, 140)
BannedLabel:SetText("Banned Players")
BannedLabel:SizeToContents()
----------

for k, v in pairs (player.GetAll()) do

	PlayerList:AddLine(v:Nick())

end

KickButton.DoClick = function( KickButton )

	for k, v in pairs (PlayerList:GetSelected()) do
	
		RunConsoleCommand("admin_kick", v:GetValue(1), ReasonBox:GetValue())
		
	end

	AdminMenu:Close()
	
	RunConsoleCommand("admin_menu")
	
end

BanButton.DoClick = function( BanButton )

	for k, v in pairs (PlayerList:GetSelected()) do
	
		RunConsoleCommand("admin_ban", v:GetValue(1), ReasonBox:GetValue())
		
	end

end

UnbanButton.DoClick = function( UnbanButton )

	for k, v in pairs (BannedPlayerList:GetSelected()) do
	
		RunConsoleCommand("admin_unban", v:GetValue(1))
		
	end
	
	AdminMenu:Close()
	
	RunConsoleCommand("admin_menu")	

end

UnbanIDButton.DoClick = function( UnbanButton )

	RunConsoleCommand("admin_unban", IDBox:GetValue())
	
	print(IDBox:GetValue())
	
	AdminMenu:Close()
	
	RunConsoleCommand("admin_menu")

end

KickButton.DoClick = function( KickButton )

	for k, v in pairs (PlayerList:GetSelected()) do
	
		RunConsoleCommand("admin_kick", v:GetValue(1), ReasonBox:GetValue())
		
	end

	AdminMenu:Close()
	
	RunConsoleCommand("admin_menu")
	
end



RunConsoleCommand("request_ban_populate")

end

concommand.Add("admin_menu", adminmenu)

function populatebanlist(caller, cmd, arg)

	if not caller:IsAdmin() then return end

	BannedPlayerList:AddLine(arg[1])

end

concommand.Add("populate_add", populatebanlist)