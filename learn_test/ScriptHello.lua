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
local noseSiMorirme


function OnGossipHi(event, player, creature)
    player:GossipMenuAddItem(0,"Hola amigo!!", 1, 1)
    player:GossipMenuAddItem(0,"No te quiero ni ver!",1,2)
    player:GossipMenuAddItem(0,"A que te meto!!",1,3)
    player:GossipMenuAddItem(0,"Ir a la casa de subastas de...",1,4)
    player:GossipMenuAddItem(0,"Pagar un Sicario.",1,5)
    player:GossipMenuAddItem(0,"Creame un rival digno!.",1,6)--Hara como el que bebe una pocion y se convertira en algun otro bicho distintas spells
    player:GossipSendMenu(1, creature, MenuId)
end

function OnGossipSelect(event, player, creature, sender, intid, code, menuid) --Creature a sido cambiado en lugar de Object como viene en la Referencias,
    if (intid == 1) then                                                       -- Ya que ayi toman object como que le puede llegar cualquier cosa, en este caso lo que tratamos es la criatura..
        player:GossipComplete()
        creature:SendUnitSay("Aloha", 0)
        
    end
    if(intid == 2) then
        player:GossipComplete()
        creature:SendUnitSay("Que te den!", 0)
        creature:EmoteState(14)--NO PASA DE AQUI
        creature:EmoteState(0)

       creature:SendUnitSay("No se si morirme..")
       noseSiMorirme = math.random(1,2)
      if(noseSiMorirme ==1)then
            -- no me muero
           creature:SendUnitSay("No me muero..")
      elseif
            --se muere
            creature:SendUnitSay("Po me muero...")
            creature:Kill(creature)

       end

    end
    if(intid == 3)then
        player:GossipComplete()           
        creature:SetFaction(44)
        creature:AttackStart(player)
        creature:SendUnitSay("Te vas a enterar tu!",0)
    end
    if(intid == 4)then
        player:GossipMenuAddItem(0,"Ventormenta.!!",1, 7)
        player:GossipMenuAddItem(0,"Ogrimar.",1,8)
        player:GossipMenuAddItem(0,"Darnassus.",1,9)
        player:GossipMenuAddItem(0,"Forjaz.",1,10)
        player:GossipMenuAddItem(0,"y mas...",1,11)
        player:GossipSendMenu(1, creature, MenuId)
    end
end


function OnLeaveCombat(event, creature)
    creature:SendUnitSay('Sali del combate jajaja', 0)
    creature:SetFaction(35)
    creature:AttackStop()
end

function OnReachHome(event, creature)
    creature:SendUnitSay('He vuelto!', 0)
    creature:SetFaction(35)
    creature:AttackStop()
end

--Si el Npc palma devuelve true
function SielNpcMuere(event, creature, killer) 
    creature:SendUnitSay("Mal nacido!!, mal rayo te partaaa...", 0)
    creature:Respawn()
    creature:SetFaction(35)
    creature:AttackStop()
end


function OnReset(event, creature)
    creature:SendUnitSay('Me he resetau', 0)
    creature:SetFaction(35)
    creature:AttackStop()
end

function OnVictimDied(event, creature, victim)
    creature:SendUnitSay('Te mate puto!', 0)
    creature:SetFaction(35)
    creature:AttackStop()
end

RegisterCreatureGossipEvent(NpcId, 1, OnGossipHi)
RegisterCreatureGossipEvent(NpcId, 2, OnGossipSelect)
RegisterCreatureEvent( NpcId, 2, OnLeaveCombat)
RegisterCreatureEvent( NpcId, 3, OnVictimDied)
RegisterCreatureEvent( NpcId, 4, SielNpcMuere)
RegisterCreatureEvent( NpcId, 23, OnReset)
RegisterCreatureEvent( NpcId, 24, OnReachHome)