--[[
    RuffoSchool <http://www.ruffoschool.com>        
    Eluna Lua Engine <https://github.com/ElunaLuaEngine/Eluna>
    Eluna Scripts <https://github.com/ElunaLuaEngine/Scripts>
    Eluna Wiki <http://wiki.emudevs.com/doku.php?id=eluna>
    Date:20170807
    
    *== Script Info ==*
    * Zona: 
    * Descripcion:
    * Npc: <MJ> Rasky <90008>
]]--

    --Variables:
local NpcId = 90008
local MenuId = 123 
local mensaje = "Aloha !!"
local insulto = "que te den!"


function OnGossipHi(event, player, object)
    player:GossipClearMenu() 
    player:GossipMenuAddItem(0,"Hola amigo!!", 1, 1)
    player:GossipMenuAddItem(0,"No te quiero ni ver!",1,2)
    player:GossipMenuAddItem(0,"A que te meto!!",1,3)
    player:GossipMenuAddItem(0,"Ir a la casa de subastas de...",1,4)
    player:GossipMenuAddItem(0,"Pagar un Sicario.",1,10)
    player:GossipMenuAddItem(0,"Creame un rival digno!.",1,11)--Hara como el que bebe una pocion y se convertira en algun otro bicho distintas spells
    player:GossipSendMenu(1, object, MenuId)
end

function OnGossipSelect(event, player, creature, sender, intid, code, menuid)
    if (intid == 1) then
        player:GossipComplete()
        creature:SendUnitSay(mensaje, 0)
        
    end
    if(intid == 2) then
         player:GossipComplete()
        creature:SendUnitSay(insulto, 0)
    end
    if(intid == 3)then
        player:GossipComplete()           
        creature:SetFaction(44)
        creature:AttackStart(player)
       creature:SendUnitSay("Te vas a enterar tu!",0)
    end
    if(intid == 4)then
         player:GossipClearMenu() 
         player:GossipMenuAddItem(0,"Ventormenta.!!",2, 5)
         player:GossipMenuAddItem(0,"Ogrimar.",2,6)
         player:GossipMenuAddItem(0,"Darnassus.",2,7)
         player:GossipMenuAddItem(0,"Forjaz.",2,8)
         player:GossipMenuAddItem(0,"y mas...",2,9)
         player:GossipSendMenu(2, object, menuid)
    end
end



--Si el Npc palma devuelve true
function SielNpcMuere(event, creature, killer) 
    creature:SendUnitSay("Mal nacido!!, que has hecho...",0)
    creature:Respawn()
    reset()
end


function OnReset(event, creature)
    reset()
end

function reset()
    creature:SetFaction(35)
    creature:AttackStop()
end

RegisterCreatureGossipEvent(NpcId, 1, OnGossipHi)
RegisterCreatureGossipEvent(NpcId, 2, OnGossipSelect)
RegisterCreatureEvent( NpcId, 4, SielNpcMuere)
RegisterCreatureEvent( NpcId, 23, OnReset)