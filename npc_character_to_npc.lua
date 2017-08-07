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
local mensaje = "Si quieres aprender a ser GM puedes unirte a nuestra escuela de GM totalmente gratis en http:://www.ruffoschool.com :)"
local emote = 387
local milisegundos = 0

local contadorEmote = 0
local tiempoEmote = 10000


local function onCreate(event, creature, diff)
	if(contadorEmote > tiempoEmote)then
		contadorEmote = 0
		creature:Emote(emote)
	end
	
	contadorEmote = contadorEmote + diff
end

local function OnGossipHello(event, player, object)
    player:GossipClearMenu() -- required for player gossip
    player:GossipMenuAddItem(0, "Quiero ser GM!!", 1, 1)
    player:GossipSendMenu(1, object, MenuId) -- MenuId required for player gossip
end

local function OnGossipSelect(event, player, creature, sender, intid, code, menuid)
    if (intid == 1) then
        player:GossipComplete()
        creature:SendUnitSay(mensaje, 0)
		--player:SendBroadcastMessage(mensaje)
	end
end

local function saludar(event, creature, unit)
    --milisegundos = milisegundos + diff
    if(unit ~= nil)then
        if (creature:IsWithinDistInMap(unit, 15) and unit:IsInAccessiblePlaceFor(creature)) then
            --creature:CastSpell(unit, 20000)
            --creature:SendUnitSay(unit:GetUnitType(), 0)
        end
    end
    --if(milisegundos > tiempoSaludar) then
        --creature:Emote(emoteSaludar)
        --milisegundos = 0
    --end
end

RegisterCreatureGossipEvent(NpcId, 1, OnGossipHello)
RegisterCreatureGossipEvent(NpcId, 2, OnGossipSelect)

RegisterCreatureEvent(NpcId, 7, onCreate)