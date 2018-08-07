local function OnDied(event, creature, killer)
  if(killer:GetObjectType() == "Player") then
    creature:SendUnitSay("Hijo de orca...", 0)
  end
end

local contador = 0
local contadorMax = 1000
local contadorSaludos = 0
local blackList = {}

local function OnUpdate(event, creature, diff)
	contador = contador + diff
	if(contador > contadorMax) then
		friendyUnits = creature:GetFriendlyUnitsInRange(10)
		for key,value in pairs(friendyUnits) do
			if(value:GetObjectType() == "Player") then
				local done = true
				for k,v in blackList do
					if(v:GetName() == value:GetName()) then
						done = false
					end
				end
				if(done == true) then
		    	creature:SendUnitSay("Saludos " .. value:GetName() .. "!", 0)
		    	blackList[contadorSaludos] = value:GetName()
		    end
		  end
		end
  	contador = 0
  end
end

RegisterCreatureEvent(12480, 4, OnDied)
RegisterCreatureEvent(12480, 7, OnUpdate)