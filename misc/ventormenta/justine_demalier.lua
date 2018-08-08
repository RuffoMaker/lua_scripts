local justine = {
	recibe_hola = 101,
	recibe_hola2 = 55,
	recibe_saludo = 78,
	envia_saludo = 78,
	entry = 12481
};

 function justine.OnReceiveEmote(event, creature, player, emoteid)
	if(emoteid == justine.recibe_hola or emoteid == justine.recibe_hola2) then
		creature:SendUnitSay("Hola cosita linda...",0)
	elseif(emoteid == justine.recibe_saludo) then
		creature:Emote(justine.envia_saludo)
	else
		creature:SendUnitSay('Y tu que miras... camina!', 0)
	end
	-- creature:SendUnitSay(emoteid,0)
	 Unit:MoveTo(0, -8824.790039, 631.929016,94.226898, true)
end

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

RegisterCreatureEvent(justine.entry, 8, justine.OnReceiveEmote)
RegisterCreatureEvent(justine.entry, 4, justine.OnDied)
-- RegisterCreatureEvent(justine.entry, 7, justine.MoveTo)