function hablar(frases, entry, tiempo)
	local tiempoFrase = tiempo
	local tiempoFraseInit = tiempo

	RegisterCreatureEvent(entry, 7, comienzaHablar)
end

function comienzaHablar(event, creature, diff)
	creature:SendUnitSay('hola', 0)
end

hablar({}, 5406, 1000)
RegisterCreatureEvent(entry, 7, comienzaHablar)