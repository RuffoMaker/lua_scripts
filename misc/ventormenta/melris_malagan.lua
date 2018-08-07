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
  creature.RemoveEvents()
end



function melrisMalagan.OnUpdate(event, creature, diff)
	melrisMalagan.contador = melrisMalagan.contador + diff
	if(melrisMalagan.contador > melrisMalagan.contadorMax) then
		friendyUnits = creature:GetFriendlyUnitsInRange(10)
		for key,value in pairs(friendyUnits) do
			if(value:GetObjectType() == "Player") then
				local done = true
				for k,v in pairs(melrisMalagan.blackList) do
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
		    	creature:SendUnitSay("¡Saludos " .. value:GetName() .. "!", 0)
		    	creature:Emote(66)
		    	melrisMalagan.blackList[melrisMalagan.contadorSaludos] = {}
		    	melrisMalagan.blackList[melrisMalagan.contadorSaludos][0] = value:GetName()
		    	melrisMalagan.blackList[melrisMalagan.contadorSaludos][1] = 100000
		    	melrisMalagan.contadorSaludos = melrisMalagan.contadorSaludos + 1
		    end
		  end
		end
  	melrisMalagan.contador = 0
  end
end

RegisterCreatureEvent(12480, 4, melrisMalagan.OnDied)
RegisterCreatureEvent(12480, 7, melrisMalagan.OnUpdate)