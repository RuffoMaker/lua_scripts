local justine = {
	entry = 12481
};

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
	-- creature:SendUnitSay(emoteid,0)
end


function justine.OnDied( event, creature, killer)	
	creature:SendUnitSay('Por favor...Que me entierren con el vibrador entre las piernas!',0)	
end


function justine.OnUpdate(event, creature, diff)
	local contador = 0
	local contadorMax = 1000
	local contadorSaludos = 0
	local blackList = {}

		friendyUnits = creature:GetFriendlyUnitsInRange(10) -- obtengo los objetivos amistosos a 10m

		for key,value in pairs(friendyUnits) do -- recorro los objetivos amistos
			if(value:GetObjectType() == "Player") then --compruebo que el objetivo sea un player								
		    	creature:SendUnitSay("¡Saludos " .. value:GetName() .. "!", 0) -- saludo al objetivo
		    	creature:Emote(66) -- hago el emote	
		    end	    	
		   
		end
 

end

RegisterCreatureEvent(justine.entry, 8, justine.OnReceiveEmote)
RegisterCreatureEvent(justine.entry, 4, justine.OnDied)
RegisterCreatureEvent(justine.entry, 7, justine.OnUpdate)