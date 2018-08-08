local melrisMalagan = {
	contador = 0,
	contadorMax = 1000,
	contadorSaludos = 0,
	blackList = {}
};

function melrisMalagan.OnDied(event, creature, killer)
  if(killer:GetObjectType() == "Player") then
    creature:SendUnitSay("Hijo de orca...", 0)
  end
  creature:RemoveEvents()
end



function melrisMalagan.OnUpdate(event, creature, diff)
	melrisMalagan.contador = melrisMalagan.contador + diff -- este contado lo uso para el check cada segundo
	if(melrisMalagan.contador > melrisMalagan.contadorMax) then -- si ha pasado el segundo
		friendyUnits = creature:GetFriendlyUnitsInRange(10) -- obtengo los objetivos amistosos a 10m
		for key,value in pairs(friendyUnits) do -- recorro los objetivos amistos
			if(value:GetObjectType() == "Player") then --compruebo que el objetivo sea un player
				local done = true -- pongo un flag a true
				for k,v in pairs(melrisMalagan.blackList) do -- recorro la blacklist
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
		    	creature:SendUnitSay("¡Saludos " .. value:GetName() .. "!", 0) -- saludo al objetivo
		    	creature:Emote(66) -- hago el emote
		    	melrisMalagan.blackList[melrisMalagan.contadorSaludos] = {} -- creo una entrada en la blacklist
		    	melrisMalagan.blackList[melrisMalagan.contadorSaludos][0] = value:GetName() -- le pongo el nombre
		    	melrisMalagan.blackList[melrisMalagan.contadorSaludos][1] = 100000 -- le pongo el tiempo restante
		    	melrisMalagan.contadorSaludos = melrisMalagan.contadorSaludos + 1 -- subo uno al contador
		    end
		  end
		end
  	melrisMalagan.contador = 0 -- pongo el contador de los segundos a 0
  end
end

RegisterCreatureEvent(12480, 4, melrisMalagan.OnDied)
RegisterCreatureEvent(12480, 7, melrisMalagan.OnUpdate)