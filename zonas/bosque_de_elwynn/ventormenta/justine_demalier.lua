local justine = {
	entry = 12481
}

 function justine.OnReceiveEmote(event, creature, player, emoteid)
 	local recibe_hola = 101
	local recibe_hola2 = 55
	local recibe_saludo = 78
	local envia_saludo = 66	

	if(emoteid == recibe_hola or emoteid == recibe_hola2) then
		creature:SendUnitSay("Hola cosita linda...",0)
	elseif(emoteid == recibe_saludo) then
		creature:Emote(envia_saludo)
	else
		creature:SendUnitSay('Y tu que miras... camina!', 0)
	end
	  
end


function justine.OnDied( event, creature, killer)	
	creature:SendUnitSay('Por favor...Que me entierren con el vibrador entre las piernas!',0)	
end


function justine.OnUpdate(event, creature, diff)
	local contador = 0
	local contadorMax = 1000
	local contadorSaludos = 0
	local blackList = {}

	contador = contador + diff -- este contado lo uso para el check cada segundo
	if(contador > contadorMax) then -- si ha pasado el segundo
		friendyUnits = creature:GetFriendlyUnitsInRange(10) -- obtengo los objetivos amistosos a 10m
		for key,value in pairs(friendyUnits) do -- recorro los objetivos amistos
			if(value:GetObjectType() == "Player") then --compruebo que el objetivo sea un player
				local done = true -- pongo un flag a true
				for k,v in pairs(blackList) do -- recorro la blacklist
					v[1] = v[1] - diff -- le resto a esta entrada el tiempo restante para sacarlo (tiempo - diff)

					if(v[0] == value:GetName()) then -- si esta entrada de la blacklist es igual al nombre del objetivo
						done = false -- pongo el flag a false
					end

					if(v[1] < 0) then -- si el tiempo restante es menor a 0
						v[0] = "" -- borro el nombre de la blacklist
		    		v[1] = 100000 -- y le reseteo el tiempo restante a la entrada vacia
					end -- esto no es lo mejor porque puedo sobrecargar la memoria, pero por el momento sirve
				end
				if(done == true) then -- si el flag esta en true
		    	creature:SendUnitSay("¡"..value:GetName().."alistaté en la marina!.", 0) -- saludo al objetivo
		    	creature:Emote(66) -- hago el emote
		    	blackList[contadorSaludos] = {} -- creo una entrada en la blacklist
		    	blackList[contadorSaludos][0] = value:GetName() -- le pongo el nombre
		    	blackList[contadorSaludos][1] = 100000 -- le pongo el tiempo restante
		    	contadorSaludos = contadorSaludos + 1 -- subo uno al contador
		    end
		  end
		end
  	contador = 0 -- pongo el contador de los segundos a 0
  end

end

RegisterCreatureEvent(justine.entry, 8, justine.OnReceiveEmote)
RegisterCreatureEvent(justine.entry, 4, justine.OnDied)
RegisterCreatureEvent(justine.entry, 7, justine.OnUpdate)