--[[
	RuffoSchool <http://www.ruffoschool.com>	    
    Eluna Lua Engine <https://github.com/ElunaLuaEngine/Eluna>
    Eluna Scripts <https://github.com/ElunaLuaEngine/Scripts>
    Eluna Wiki <http://wiki.emudevs.com/doku.php?id=eluna>
	Date:20170807
	
	*== Script Info ==*
	* Zona: 
	* Descripcion:
	* Npc: <MJ> Rasky <90002>
]]--

	--Variables:
	local npcID = 90002
	local mensaje = "Rasky!!!!"
	local menuID = 123
	
local function OnGossipHello(event, player, object)
	--SendWorldMessage( nombre )
	--creature:SendUnitSay( '¡¡¡Wooooff woooof!!!', 0 )
	player:GossipClearMenu() -- required for player gossip
	Player:GossipMenuAddItem( 1, "hola amigo", 1, 1 )
	player:GossipSendMenu(1, object, menuID)
	Unit:SendUnitSay( mensaje, 0 )

end


RegisterCreatureEvent( npcID, 1, OnGossipHello )