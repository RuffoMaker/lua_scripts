local hablar = {}

function hablar.config(frases, entry, tiempo)
	local tiempoFrase = tiempo
	local tiempoFraseInit = tiempo

	RegisterCreatureEvent(entry, 7, hablar.start)
end

local function hablar.start(event, creature, diff)
	creature:SendUnitSay('hola', 0)
end

hablar.config(0, 5406, 1000)
RegisterCreatureEvent(5406, 7, hablar.start)