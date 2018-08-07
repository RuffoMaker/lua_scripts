local justine = {	
	-- entry = 12481	
} 

function justine.saludar(event, creature, player, emoteid)
	creature:SendUnitSay( 'Juan donde esta mi maldicho Chorizo portuano para mi ano!.', 0 );
	creature:Emote(14);
end

-- RegisterCreatureEvent(entry, 8, saludar)

