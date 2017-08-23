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
    * Npc: <Sicario> El Mata Suegras <90014>
]]--

    --Variables:
local NpcId = 90008
local NpcSicario = 90014 
local MenuId = 123 
local noseSiMorirme = 0
local quesubastador = 0
local bando = 0


function OnGossipHi(event, player, creature)
    player:GossipMenuAddItem(0,"Hola amigo!!", 1, 1)
    player:GossipMenuAddItem(0,"No te quiero ni ver!",1,2)
    player:GossipMenuAddItem(0,"A que te meto!!",1,3)
    player:GossipMenuAddItem(0,"Ir a la casa de subastas de...",1,4)
    player:GossipMenuAddItem(0,"Pagar un Sicario.",1,5) -- Invocara un NPC llamado Jhony este  hablara con el player , el cual le pagara dinero opcionalmente , tras el cual se decidira si matar a el o al player indicado
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
        creature:Emote(14)


       creature:SendUnitSay("No se si morirme..", 0)
       noseSiMorirme = math.random(1,2)
      if(noseSiMorirme == 1)then
            -- no me muero
           creature:SendUnitSay("No me muero..", 0)
           Creature:Emote(0)
      else
            --se muere
            creature:SendUnitSay("Po me muero...", 0)
            creature:Kill(creature)

       end

    end --EN PRUEBAS <=============================== CONTROLAS los tiempos entre accion  y acccion updateai para que te entiendas como los  hilos de espera three sleep

    if(intid == 3)then
        player:GossipComplete()           
        creature:SetFaction(44)
        creature:AttackStart(player)
        creature:SendUnitSay("Te vas a enterar tu!",0)
    end
    if(intid == 4)then
        --Comprobar de que bando es el player para mostrar unos Telepors o otros.
         bando = player:GetTeam()
        if(bando == 0)then
            player:GossipMenuAddItem(0,"Ventormenta.",1, 7) 
            player:GossipMenuAddItem(0,"Exodar.",1,8)
            player:GossipMenuAddItem(0,"Darnassus.",1,9)
            player:GossipMenuAddItem(0,"Forjaz.",1,10)
            player:GossipMenuAddItem(0,"Gadgetzan.",1,15)
            player:GossipMenuAddItem(0,"Bahía del Botín",1,17)           
         end

         if(bando == 1)then
            player:GossipMenuAddItem(0,"Orgrimar",1,11)
            player:GossipMenuAddItem(0,"Entrañas.",1,12)
            player:GossipMenuAddItem(0,"Cima del Trueno.",1,13)
            player:GossipMenuAddItem(0,"Lunargenta.",1,14)
            player:GossipMenuAddItem(0,"Gadgetzan.",1,16)
            player:GossipMenuAddItem(0,"Bahía del Botín",1,18)
        end

        player:GossipSendMenu(1, creature, MenuId)
    end

                --     ** PROBANDO SICARIO (**En proceso**)**
    if(intid == 5)then 
        creature:SendUnitSay("mmm.. llamaré a mi primo.., pero ten cuidado con él..",0)
        creature:SendUnitSay("Capi!!!, Capi!! tienes un cliente!!,deja de tocarte y sal a atenderlo!",0)
        spawnedCreature = WorldObject:SpawnCreature( NpcSicario, 16233.423164, 16266.337891, 13.460457, 4.740612 )      
        creature:SendUnitSay("Que si enano..., no discutamos delante de los clientes..",0) --POR AQUI

    end

    ---             Fin SIcario--


                                                    --**    TPs     ALIANZA **--


    ---------------------------- TP a subastas Ventormenta
    if(intid == 7)then
        creature:SendUnitSay("Vete de compras!", 0)
        player:Teleport(0,-8806.485352, 667.406067, 96.201530, 3.339079)
        player:GossipComplete()
    end
    -------------------------

   ---------------------------- TP a subastas Exodar
    if(intid == 8)then
        creature:SendUnitSay("Vete de compras!", 0)
        player:Teleport(530,-4009.186768, -11727.350586, -151.669388, 3.742418)
        player:GossipComplete()
    end

   ---------------------------- TP a subastas Darnasus
    if(intid == 9)then
      creature:SendUnitSay("Vete de compras!", 0)
      player:Teleport(1, 9861.601562, 2332.566650, 1321.589233, 1.171752)
      player:GossipComplete()
    end
    -------------------------

    ---------------------------- TP a subastas Forjaz
    if(intid == 10)then
        creature:SendUnitSay("Vete de compras!", 0)
        player:Teleport(0,-4956.250977, -913.123901, 503.837250, 2.260383)
        player:GossipComplete()
    end
    -------------------------
                                                    --** TPs NEUTRALES **--

        ---------------------------- TP a subastas Gadgetzan Tanto Alianza Como Horda
    if(intid == 15 or intid == 16)then
        creature:SendUnitSay("Vete de compras!", 0)
        player:Teleport(1,-7229.063965, -3803.919189, -1.132274, 3.120378)
        player:GossipComplete()
    end

           ---------------------------- TP a subastas Bahia del Botin Tanto Alianza Como Horda
    if(intid == 17 or intid == 18)then
        creature:SendUnitSay("Vete de compras!", 0)
        player:Teleport(0,-14418.891602, 519.901123, 5.012455, 0.456693) --FALLO AQUI NO TELEPORTA
        player:GossipComplete()
    end
    ---------
                                                    --**    TPs     HORDA **--
    
    ---------------------------- TP a subastas Orgrimar
    if(intid == 11)then
        creature:SendUnitSay("Vete de compras!", 0)
        player:Teleport(1,1677.250488, -4448.273926, 19.300270, 5.236221)
        player:GossipComplete()
    end
    -------------------------

    ---------------------------- TP a subastas Entrañas
    if(intid == 12)then
        quesubastador = math.random(1,4)
        if(quesubastador == 1)then
             creature:SendUnitSay("Vete de compras con Leeka!", 0)
             player:Teleport(0,1546.590942, 215.702133, -57.343666, 2.005278)
             player:GossipComplete()
        elseif(quesubastador == 2)then
            creature:SendUnitSay("Vete de compras con Epitwee!",0)
            player:Teleport(0,1547.365601, 264.540894, -57.232708, 4.168646)
            player:GossipComplete()
         elseif(quesubastador == 3)then
            creature:SendUnitSay("Vete de compras con Naxxremis!",0)
            player:Teleport(0,1646.284058, 261.979309, -57.052540, 5.178545)
            player:GossipComplete()
         elseif(quesubastador == 4)then
            creature:SendUnitSay("Vete de compras con Yarly!",0)
            player:Teleport(0,1619.149170, 191.457413, -57.257435, 3.632101)
            player:GossipComplete()
        end
    end
    -------------------------

    ---------------------------- TP a subastas Cima del Trueno
    if(intid == 13)then
        quesubastador = math.random(1,2)
       if(quesubastador == 1)then
             creature:SendUnitSay("Vete de compras con Gullem!", 0)
             player:Teleport(1,-1206.035767, 110.675369, 134.364532, 0.037546)
             player:GossipComplete()
        elseif(quesubastador == 2)then
            creature:SendUnitSay("Vete de compras con Stampi!",0)
            player:Teleport(1,-1215.408081, 95.161316, 133.384949, 6.176222)
            player:GossipComplete()
        end
    end
    -------------------------

  ---------------------------- TP a subastas Lunargenta
    if(intid == 14)then
        quesubastador = math.random(1,4)
        if(quesubastador == 1)then
             creature:SendUnitSay("Vete de compras con Feynna!", 0)
             player:Teleport(530,9648.618164, -7149.251465, 14.326870, 1.608076)
             player:GossipComplete()
        elseif(quesubastador == 2)then
            creature:SendUnitSay("Vete de compras con Vynna!",0) --revisar posicion
            player:Teleport(530,9635.428711, -7136.004883, 14.328348, 0.067910)
            player:GossipComplete()
         elseif(quesubastador == 3)then
            creature:SendUnitSay("Vete de compras con Jenath!",0)
            player:Teleport(530,9648.125977, -7122.189941, 14.328078, 4.860484)
            player:GossipComplete()
         elseif(quesubastador == 4)then
            creature:SendUnitSay("Vete de compras con Darise!",0)
            player:Teleport(530,9662.083008, -7135.994141, 14.327104, 3.193010)
            player:GossipComplete()
        end
    end
    ------------------------------

end


function OnLeaveCombat(event, creature)
    creature:SendUnitSay('Sali del combate jajaja', 0)
    creature:ClearThreatList()--Elimina la lista de amenazas de la criatura
    creature:SetFaction(35)
    --creature:AttackStop()
end

--function OnReachHome(event, creature)  (No tiene utilidad llamar a esta funcion  Nº24 APARENTEMENTE)
   -- creature:SendUnitSay('He vuelto!', 0)  
   -- creature:SetFaction(35)
   -- creature:AttackStop()
--end

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

RegisterCreatureEvent(NpcSicario,19, InvocaNpc)
--RegisterCreatureEvent( NpcId, 24, OnReachHome) (No tiene Utilidad llamar a este evento ni a su funcion Nº 24 APARENTEMENTE)

--[[
 function InvocaNpc(event, creature, summon)
            creature:SummonPlayer(creature)
            creature:SendUnitSay("No me llames Capi!!!!, me llamo El Mata Suegras!!.",0)
 end]]