local justine = {
	recibe_hola = 70,
	recibe_saludo = 17,
	envia_saludo = 400,
	entry = 12481
};

 function justine.ReceiveEmote(event, creature, player, emoteid)
	if(emoteid == justineDemalier.recibe_hola) then
		creature:SendUnitSay("Hola cosita linda...",0)
	elseif(emoteid == justineDemalier.recibe_saludo) then
		creature:Emote(justineDemalier.envia_saludo)
	else
		creature:SendUnitSay('Y tu que miras... camina!', 0)
	end

	-- Unit:MoveTo(0, -8824.790039, 631.929016,94.226898, true)
end

-- RegisterCreatureEvent(justineDemalier.entry, 8, justineDemalier.saludar)

function justine.hello(event, creature, player, emoteid)
	creature:SendUnitSay( 'Juan donde esta mi maldicho Chorizo portuano para mi ano!.', 0 )
	creature:Emote(14)
end


function justine.OnDied( event, creature, killer)	
	creature:SendUnitSay('Por favor...Que me entierren con el vibrador entre las piernas!',0)	
end

function justine.onAiUpdate(event, creature, diff)

 Unit:MoveTo(0, -8824.790039, 631.929016,94.226898, true)
	
end

RegisterCreatureEvent(justine.entry, 8, justine.ReceiveEmote)
RegisterCreatureEvent(justine.entry, 4, justine.OnDied)
-- RegisterCreatureEvent(justine.entry, 7, justine.MoveTo)