--[[
    RuffoSchool <http://www.ruffoschool.com>
    Eluna Lua Engine <https://github.com/ElunaLuaEngine/Eluna>
    Eluna Scripts <https://github.com/ElunaLuaEngine/Scripts>
    Eluna Wiki <http://wiki.emudevs.com/doku.php?id=eluna>
    -= Script Information =-
    * Zone: Varias
    * Script Type: NPC Gossip
    * Npc: <MJ>Ruffomaker <90000>
--]]


local NpcId = 50000
local MenuId = 123 -- Unique ID to recognice player gossip menu among others

local personaje = ''
local subnombre = ''
local capucha = ''

local function OnGossipHello(event, player, object)
    player:GossipClearMenu() -- required for player gossip
    player:GossipMenuAddItem(0, "Crear un NPC a partir de un Personaje.", 1, 1)
    player:GossipSendMenu(1, object, MenuId) -- MenuId required for player gossip
end

local function OnGossipSelect(event, player, object, sender, intid, code, menuid)
    if (intid == 1) then
        player:GossipMenuAddItem(0, "Escribir el Nombre del Personaje.", 1, 2, true, nil)
        player:GossipMenuAddItem(0, "Cancelar", 1, 3)
		player:GossipSendMenu(1, object, MenuId)
	elseif (intid == 2) then
		personaje = code
		object:sendUnitSay(personaje)
		player:GossipSendMenu(1, object, MenuId)
	elseif (intid == 3) then
		player:GossipComplete()
	end
	
	
	--creature:SendUnitSay(mensaje, 0)
	--player:SendBroadcastMessage(mensaje)
	--player:GossipComplete()
end

RegisterCreatureGossipEvent(NpcId, 1, OnGossipHello)
RegisterCreatureGossipEvent(NpcId, 2, OnGossipSelect)