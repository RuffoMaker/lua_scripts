function moveClose(event, creature, unit)
	creature.SendUnitSay('Hola!', 1)
end

RegisterCreatureEvent(12480, 27, moveClose)