local justineDemalier = {
	entry = 12481
}

function justineDemalier.saludar(event, creature, player, emoteid)
	creature:SendUnitSay( 'Juan donde esta mi maldicho Chorizo portuano para mi ano!.', 0 )
	creature:Emote(14)
end

RegisterCreatureEvent(justineDemalier.entry, 8, justineDemalier.saludar)

