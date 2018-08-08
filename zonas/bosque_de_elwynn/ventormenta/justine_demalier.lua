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

	contador = contador + diff
	if(contador > contadorMax) then
		friendyUnits = creature:GetFriendlyUnitsInRange(7)
		for key,value in pairs(friendyUnits) do
			if(value:GetObjectType() == "Player") then
				local done = true
				for k,v in pairs(blackList) do
					v[1] = v[1] - diff

					if(v[0] == value:GetName()) then
						done = false
					end

					if(v[1] < 0) then
						v[0] = ""
		    		v[1] = 100000
					end
				end
				if(done == true) then
		    	creature:SendUnitSay("¡Oiga!" .. value:GetName() .. "¿,desea usted alistarse?", 0)
		    	creature:Emote(66)
		    	blackList[contadorSaludos] = {}
		    	blackList[contadorSaludos][0] = value:GetName()
		    	blackList[contadorSaludos][1] = 100000
		    	contadorSaludos = contadorSaludos + 1
		    end
		  end
		end
  	contador = 0
  end
end


function justine.prueba(event, creature, diff)
	local list = {}
	friendyUnits = creature:GetFriendlyUnitsInRange(10)
	list = friendyUnits
	
	for i,v in pairs (list) do
		creature:SendUnitSay("numero: "..i.." es:"..v)
	end
end

RegisterCreatureEvent(justine.entry, 8, justine.OnReceiveEmote)
RegisterCreatureEvent(justine.entry, 4, justine.OnDied)
RegisterCreatureEvent(justine.entry, 7, justine.prueba)