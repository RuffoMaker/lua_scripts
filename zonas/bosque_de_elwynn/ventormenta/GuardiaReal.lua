local guardiaReal = {
	contador = 0,
	contadorMax = 1000,
	contadorSaludos = 0,
	blackList = {}
};


function guardiaReal.OnUpdate(event, creature, diff)
	guardiaReal.contador = guardiaReal.contador + diff -- este contado lo uso para el check cada segundo
	if(guardiaReal.contador > guardiaReal.contadorMax) then -- si ha pasado el segundo
		friendyUnits = creature:GetFriendlyUnitsInRange(5) -- obtengo los objetivos amistosos a 10m	
			if(value:GetObjectType() == "Player") then --compruebo que el objetivo sea un player
		    	creature:Emote(66) -- hago el emote    	
		    end		 		
  	guardiaReal.contador = 0 -- pongo el contador de los segundos a 0
  end
end

RegisterCreatureEvent(1756, 7, guardiaReal.OnUpdate)
