--Created by Cake Master
--Edited By Dorkslayz


local function AddText ( Text, Owner )
	local CategoryContentOne = vgui.Create("DLabel")
	CategoryContentOne:SetText(Text)
	CategoryContentOne:SizeToContents()
 	Owner:AddItem(CategoryContentOne)
end

 function jail_main()
 
	local DermaPanel = vgui.Create("DFrame")
	DermaPanel:SetPos(400, 200)
	DermaPanel:SetSize(500, 410)
	DermaPanel:SetTitle("Main Menu")
	DermaPanel:SetVisible(true)
	DermaPanel:SetDraggable(false)
	DermaPanel:ShowCloseButton(true)
	DermaPanel:MakePopup()

	local PropertySheet = vgui.Create("DPropertySheet", DermaPanel)
	PropertySheet:StretchToParent(5, 30, 5, 5)

	local PanelList = vgui.Create("DPanelList");
	PanelList:EnableHorizontal(false)
	PanelList:EnableVerticalScrollbar(true)
	PanelList:SetPadding(5);
	
	local PanelList1 = vgui.Create("DPanelList");
	PanelList1:EnableHorizontal(false)
	PanelList1:EnableVerticalScrollbar(true)
	PanelList1:SetPadding(5);
	
	
	AddText('Coming soon', PanelList1); -- This is the text itself
	AddText('', PanelList1); -- Im making this so the text isnt fucked
	
	
 team_1 = vgui.Create( "DButton", PanelList );
 team_1:SetPos( 30, 25 )
 team_1:SetSize( 410, 50 ) 
 team_1:SetText( "Guard" ) 
 team_1.DoClick = function()
     
     RunConsoleCommand( "TEAM_GUARD" ) 
 
 end 
 
 team_2 = vgui.Create( "DButton", PanelList );
 team_2:SetPos( 30, 90 )
 team_2:SetSize( 410, 50 ) 
 team_2:SetText( "Prisoner" ) 
 team_2.DoClick = function()
     
     RunConsoleCommand( "TEAM_PRISONER" ) 
 
 end 
 
	PropertySheet:AddSheet("Class", PanelList, "gui/silkicons/user")
	PropertySheet:AddSheet("Rules", PanelList1, "gui/silkicons/exclamation")

concommand.Add("jailmenu", jail_main)
concommand.Add( "TEAM_GUARD", TEAM_GUARD )
concommand.Add( "TEAM_PRISONER", TEAM_PRISONER )

end
	