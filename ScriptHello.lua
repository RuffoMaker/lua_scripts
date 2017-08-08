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
local NpcId = 90002
local MenuId = 123 -- Unique ID to recognice player gossip menu among others
local mensaje = "Rasky !!"


local function OnGossipHello(event, player, object)
    player:GossipClearMenu() -- required for player gossip
    player:GossipMenuAddItem(0, "Hola amigo!!", 1, 1)
    player:GossipSendMenu(1, object, MenuId) -- MenuId required for player gossip
end

local function OnGossipSelect(event, player, creature, sender, intid, code, menuid)
    if (intid == 1) then
        player:GossipComplete()
        creature:SendUnitSay(mensaje, 0)
		--player:SendBroadcastMessage(mensaje)
	end
end

RegisterCreatureGossipEvent(NpcId, 1, OnGossipHello)
RegisterCreatureGossipEvent(NpcId, 2, OnGossipSelect)