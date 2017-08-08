local entry = 299

function saludar(event, creature, target)
	creature:SendUnitSay( '¡¡¡Wooooff woooof!!!', 0 )
end

RegisterCreatureEvent(entry, 1, saludar)