local function OnDied(event, creature, killer)
  if(killer:GetObjectType() == "Player") then
    creature:SendUnitSay("Hijo de orca...", 0)
  end
end

local contador = 0
local contadorMax = 1000

local function OnUpdate(event, creature, diff)
	contador = contador + diff
	if(contador > contadorMax) then
		Saludar(creature)
  	contador = 0
  end
end

local function Saludar(creature)
	friendyUnits = creature:GetFriendlyUnitsInRange(10)
	for key,value in friendyUnits do
		if(value:GetObjectType() == "Player") then
	    creature:SendUnitSay("Hola!!", 0)
	  end
	end
end

RegisterCreatureEvent(12480, 4, OnDied)
RegisterCreatureEvent(12480, 7, OnUpdate)