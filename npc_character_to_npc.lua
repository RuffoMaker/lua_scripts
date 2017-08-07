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
local capucha = true

local emoteCasting = 173
local emoteFinishCast = 439

local estado = ''
local entry = '0'

local tiempo = 0
local tiempoBuscandoPersonaje = 4000
local buscandoPersonajeDicho = false
local tiempoPersonajeEncontrado = 2000
local personajeEncontradoDicho = false
local tiempoCreandoPersonaje = 5000
local creandoPersonajeDicho = false
local tiempoPersonajeCreado = 4000
local personajeCreadoDicho = false
local tiempoRecordatorio = 2000
local recordatorioDicho = false





function OnGossipHello(event, player, object)
	reset()
    player:GossipClearMenu() -- required for player gossip
    player:GossipMenuAddItem(0, "Crear un NPC a partir de un Personaje.", 1, 1)
    player:GossipSendMenu(1, object, MenuId) -- MenuId required for player gossip
end

function OnGossipSelect(event, player, object, sender, intid, code, menuid)
    if (intid == 1) then
        player:GossipMenuAddItem(0, "Escribir el Nombre del Personaje.", 1, 2, true, nil)
        player:GossipMenuAddItem(0, "Cancelar", 1, 3)
		player:GossipSendMenu(1, object, MenuId)
	elseif (intid == 2) then
		personaje = code
		
		player:GossipMenuAddItem(0, "Escribir el SubNombre del Personaje.", 1, 4, true, nil)
        player:GossipMenuAddItem(0, "Cancelar", 1, 3)
		
		player:GossipSendMenu(1, object, MenuId)
	elseif (intid == 4) then
		subnombre = code
		
		player:GossipMenuAddItem(0, "El personaje lleva la capucha puesta.", 1, 5)
		player:GossipMenuAddItem(0, "El personaje NO lleva la capucha puesta.", 1, 6)
        player:GossipMenuAddItem(0, "Cancelar", 1, 3)
		
		player:GossipSendMenu(1, object, MenuId)
	elseif (intid == 5) then
		capucha = true
		--crearNPC(player, object)
		estado = 'buscandoPersonaje'
		player:GossipComplete()
	elseif (intid == 6) then
		capucha = false
		--crearNPC(player, object)
		estado = 'buscandoPersonaje'
		player:GossipComplete()
	elseif (intid == 3) then
		player:GossipComplete()
	end
	
	
	--creature:SendUnitSay(mensaje, 0)
	--player:SendBroadcastMessage(mensaje)
	--player:GossipComplete()
end

function creatureAI(event, creature, diff)
	if(estado == 'buscandoPersonaje') then
		if(buscandoPersonajeDicho == false) then
			creature:SendUnitSay('Veamos...', 0)
			buscandoPersonajeDicho = true
			tiempo = 0
		end
		if(tiempo > tiempoPersonajeEncontrado) then
			estado = 'personajeEncontrado'
			tiempo = 0
		end
		
		creature:Emote(emoteCasting)
	end
	
	if(estado == 'personajeEncontrado') then
		if(personajeEncontradoDicho == false) then
			creature:SendUnitSay('He encontrado el personaje '..personaje..' en la base de datos.', 0)
			personajeEncontradoDicho = true
			tiempo = 0
		end
		if(tiempo > tiempoBuscandoPersonaje) then
			estado = 'creandoPersonaje'
			tiempo = 0
		end
		
		creature:Emote(emoteCasting)
	end
	
	if(estado == 'creandoPersonaje') then
		if(creandoPersonajeDicho == false) then
			creature:SendUnitSay('Estoy creando el NPC...', 0)
			creandoPersonajeDicho = true
			tiempo = 0
		end
		if(tiempo > tiempoCreandoPersonaje) then
			estado = 'personajeCreado'
			tiempo = 0
		end
		
		creature:Emote(emoteFinishCast)
	end
	
	if(estado == 'personajeCreado') then
		if(personajeCreadoDicho == false) then
			creature:SendUnitSay('Ya esta... El entry del NPC que he creado es el 1234.', 0)
			personajeCreadoDicho = true
			tiempo = 0
		end
		if(tiempo > tiempoPersonajeCreado) then
			estado = 'recordatorio'
			tiempo = 0
		end
	end
	
	if(estado == 'recordatorio') then
		if(recordatorioDicho == false) then
			creature:SendUnitSay('Recuerda que debes reiniciar el servidor para poder ver los cambios efectuados.', 0)
			recordatorioDicho = true
			tiempo = 0
		end
		if(tiempo > tiempoRecordatorio) then
			estado = ''
			tiempo = 0
			reset()
		end
	end
	
	
	
	tiempo = tiempo + diff
end

function reset()
	estado = ''
	entry = '0'
	tiempo = 0
	personaje = ''
	subnombre = ''
	capucha = true
	buscandoPersonajeDicho = false
	personajeEncontradoDicho = false
	creandoPersonajeDicho = false
	personajeCreadoDicho = false
	recordatorioDicho = false
end

function crearNPC(player, creature)
	
	
	creature:SendUnitSay('He encontrado el personaje '..personaje..' en la base de datos...', 0)
	creature:Emote(emoteFinishCast)
	creature:SendUnitSay('Estoy creando el NPC...', 0)
	
	--player:SendBroadcastMessage('El nombre del Personaje es ' .. personaje)
	--player:SendBroadcastMessage('El subnombre del Personaje es ' .. subnombre)
	--if(capucha == true) then
		--player:SendBroadcastMessage('El Personaje lleva la capucha puesta.')
	--else
		--player:SendBroadcastMessage('El Personaje no lleva la capucha puesta.')
	--end
	
	WorldDBQuery("SELECT entry, name FROM creature_template LIMIT 10")
end

RegisterCreatureGossipEvent(NpcId, 1, OnGossipHello)
RegisterCreatureGossipEvent(NpcId, 2, OnGossipSelect)

RegisterCreatureEvent(NpcId, 7, creatureAI)