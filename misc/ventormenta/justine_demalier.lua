local entry = 12481

function saludar(event, creature, target)
	creature:SendUnitSay( 'Juan donde esta mi maldicho Chorizo portuano para mi ano!.', 0 )
	creature:Emote(14)

end


RegisterCreatureEvent(entry, 1, saludar)

