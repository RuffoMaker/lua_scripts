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
	local nombre = "Rasky!!!!"
	local menuID = 321
	
local function OnGossipHello(event, player, object)
	player:GossipMenuAddItem(0, "Hola señor!.", 1, 1)
	player:GossipSendMenu(1, object, MenuId) -- MenuId required for player gossip
	creature:SendUnitSay( '¡¡¡Hola Rasky Player!!!', 0 )
end


RegisterCreatureEvent( npcID, 1, OnGossipHello )