local guardiaReal = {
	contador = 0,
	contadorMax = 5000		
};


function guardiaReal.OnUpdate(event, creature, diff)
	guardiaReal.contador = guardiaReal.contador + diff -- este contado lo uso para el check cada segundo
	if(guardiaReal.contador > guardiaReal.contadorMax) then -- si ha pasado el segundo
		friendyUnits = creature:GetFriendlyUnitsInRange(10) -- obtengo los objetivos amistosos a 10m
		for key,value in pairs(friendyUnits) do -- recorro los objetivos amistos
			if(value:GetObjectType() == "Player") then --compruebo que el objetivo sea un player
		    	creature:Emote(66) -- hago el emote	    	
		    end
		 
		end
  	guardiaReal.contador = 0 -- pongo el contador de los segundos a 0
  end
end


 function guardiaReal.OnReceiveEmote(event, creature, player, emoteid)
	local recibe_saludo = 66	

	if(emoteid == recibe_saludo) then		
		if(player:GetGender() == 0) then
		     creature:SendUnitSay(" Sr comandante "..player:GetName().."...", 0)
		end

		if(player:GetGender() == 1) then
		    creature:SendUnitSay(" Sra comandante "..player:GetName().."...", 0) 
		end
		 	
	end
	  
end


 function guardiaReal.OnReceiveEmote2(event, creature, player, emoteid)
	 	

	
	local recibe_hola = 101
	local recibe_hola2 = 55
	local recibe_saludo = 78
	local envia_saludo = 66	

	if(emoteid == recibe_hola or emoteid == recibe_hola2) then
		creature:SendUnitSay("Hola cosita linda...",0)
	elseif(emoteid == recibe_saludo) then
		creature:Emote(envia_saludo)
		creature:SendUnitSay("¡"..player:GetName().." alistaté en la marina!.", 0) -- saludo al objetivo
	else
		creature:SendUnitSay('Y tu que miras... camina!', 0)
	end
		   
		
		 	
	end
	  
end

RegisterCreatureEvent(1756, 7, guardiaReal.OnUpdate)
RegisterCreatureEvent(1756, 8, guardiaReal.OnReceiveEmote2)