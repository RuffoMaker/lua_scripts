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
local insulto = "que te den!"


local function OnGossipHi(event, player, object)
    player:GossipClearMenu() -- required for player gossip
    player:GossipMenuAddItem(0, "Hola amigo!!", 1, 1)
    player:GossipMenuAddItem(0,"No te quiero ni ver!",1,2)
    player:GossipSendMenu(1, object, MenuId) -- MenuId required for player gossip
end

local function OnGossipSelect(event, player, creature, sender, intid, code, menuid)
    if (intid == 1) then
        player:GossipComplete()
        creature:SendUnitSay(mensaje, 0)
		--player:SendBroadcastMessage(mensaje)
	end
	if(intid == 2) then
		 player:GossipComplete()
        creature:SendUnitSay(insulto, 0)
    end
end

RegisterCreatureGossipEvent(NpcId, 1, OnGossipHi)
RegisterCreatureGossipEvent(NpcId, 2, OnGossipSelect)