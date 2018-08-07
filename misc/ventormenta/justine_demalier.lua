local justine = {
	recibe_hola = 101,
	recibe_saludo = 78,
	envia_saludo = 66,
	entry = 12481
};

 function justine.hello(event, creature, player, emoteid)
	if(emoteid == justineDemalier.recibe_hola) then
		creature:SendUnitSay("Aloooo",0)
	elseif(emoteid == justineDemalier.recibe_saludo) then
		creature:Emote(justineDemalier.envia_saludo)
	else
		creature:SendUnitSay('Ese emote no me gusta.', 0)
	end
end

--RegisterCreatureEvent(justineDemalier.entry, 8, justineDemalier.saludar)

function justine.saludar(event, creature, player, emoteid)
	creature:SendUnitSay( 'Juan donde esta mi maldicho Chorizo portuano para mi ano!.', 0 )
	creature:Emote(14)
end


function justine.morir( event, creature, killer)
	creature:Emote(18)
	creature:SendUnitSay('Por favor...Que me entierren con el vibrador entre las piernas!',0)	
end

RegisterCreatureEvent(justine.entry, 8, justine.saludar)
RegisterCreatureEvent(justine.entry, 4, justine.morir)