local guardiaReal = {
	contador = 0,
	contadorMax = 5000,
	contadorSaludos = 0,
	blackList = {}
};


function guardiaReal.OnUpdate(event, creature, diff)
	guardiaReal.contador = guardiaReal.contador + diff -- este contado lo uso para el check cada segundo
	if(guardiaReal.contador > guardiaReal.contadorMax) then -- si ha pasado el segundo
		friendyUnits = creature:GetFriendlyUnitsInRange(8) -- obtengo los objetivos amistosos a 10m
		for key,value in pairs(friendyUnits) do -- recorro los objetivos amistos
			if(value:GetObjectType() == "Player") then --compruebo que el objetivo sea un player
		    	creature:Emote(66) -- hago el emote
		    	local rnd = math.random(0, 1)
		    	if(rnd == 1) then
		    		if(value:GetGender()==0) then
		    			creature:SendUnitSay("Sr!",0)
		    		end

		    		if(value:GetGender()==1) then
		    			creature:SendUnitSay("Sra!",0)
		    		end
		    	end
		    end
		 
		end
  	guardiaReal.contador = 0 -- pongo el contador de los segundos a 0
  end
end


 function guardiaReal.OnReceiveEmote(event, creature, player, emoteid)
	local envia_saludo = 66	

	if(emoteid == recibe_saludo) then
		





		creature:SendUnitSay("¡"..player:GetName().." alistaté en la marina!.", 0) 	
	end
	  
end


RegisterCreatureEvent(1756, 7, guardiaReal.OnUpdate)
-- RegisterCreatureEvent(1756, 8, guardiaReal.OnReceiveEmote)