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
local MenuId = 123 
local mensaje = "Aloha !!"
local insulto = "que te den!"


local function OnGossipHi(event, player, object)
    player:GossipClearMenu() 
    player:GossipMenuAddItem(0, "Hola amigo!!", 1, 1)
    player:GossipMenuAddItem(0,"No te quiero ni ver!",1,2)
    player:GossipMenuAddItem(0,"A que te meto!!",1,3)
    player:GossipMenuAddItem(0,"Ir a la casa de subastas de...",1,4)
    player:GossipMenuAddItem(0,"Pagar un Sicario.",1,5)
        player:GossipMenuAddItem(0,"Creame un rival digno!.",1,6)
    player:GossipSendMenu(1, object, MenuId)
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
    if(intid == 3)then
        player:GossipComplete()     
        --player = Unit:Attack(player )
        creature:Attack(player, false )

    end
    if(intid == 4)then
         player:GossipClearMenu() 
         player:GossipMenuAddItem(0, "Ventormenta.!!", 1, 7)
         player:GossipMenuAddItem(0,"Ogrimar.",1,8)
         player:GossipMenuAddItem(0,"Darnassus.",1,9)
         player:GossipMenuAddItem(0,"Forjaz.",1,10)
         player:GossipMenuAddItem(0,"y mas...",1,11)
    end
end

RegisterCreatureGossipEvent(NpcId, 1, OnGossipHi)
RegisterCreatureGossipEvent(NpcId, 2, OnGossipSelect)