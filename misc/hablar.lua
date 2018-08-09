function hablarConfig(frases, entry, tiempo)
	local tiempoFrase = tiempo
	local tiempoFraseInit = tiempo

	RegisterCreatureEvent(entry, 7, hablarStart)
end

local function hablarStart(event, creature, diff)
	creature:SendUnitSay('hola', 0)
end

hablarConfig(0, 5406, 1000)
hablarConfig(0, 5403, 1000)