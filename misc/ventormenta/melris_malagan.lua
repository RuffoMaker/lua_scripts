local function OnDied(event, creature, killer)
  if(killer:GetObjectType() == "Player") then
    killer:SendBroadcastMessage("You killed " ..creature:GetName().."!")
  end
end

local contador = 0
local contadorMax = 10000

local function OnUpdate(event, creature, diff)
	contador = contador + diff
	if(contador > contadorMax) then
  	creature:SendUnitSay("14 años en el mismo sitio y por fin aprendo a hablar...", 0)
  	contador = 0
  end
end

RegisterCreatureEvent(12480, 4, OnDied)
RegisterCreatureEvent(12480, 7, OnUpdate)