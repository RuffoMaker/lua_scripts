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
	local menuID = 321
	
local function OnGossipHello(event, player, object)
	--SendWorldMessage( nombre )
	--creature:SendUnitSay( '¡¡¡Wooooff woooof!!!', 0 )
	Unit:SendUnitSay( mensaje, 0 )
	--[[player:GossipMenuAddItem(0, "Hola señor!.", 1, 1)
	player:GossipSendMenu(1, object, MenuId) 
	creature:SendUnitSay( '¡¡¡Hola Rasky Player!!!', 0 )
	player:GossipSendMenu(1, object, MenuId) -- MenuId required for player gossip--]]
	
end


RegisterCreatureEvent( npcID, 1, OnGossipHello )