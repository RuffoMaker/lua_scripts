local justine = {
	entry = 12481
}

 function justine.OnReceiveEmote(event, creature, player, emoteid)
 	local recibe_hola = 101
	local recibe_hola2 = 55
	local recibe_saludo = 78
	local envia_saludo = 66	

	if(emoteid == recibe_hola or emoteid == recibe_hola2) then
		creature:SendUnitSay("Hola cosita linda...",0)
	elseif(emoteid == recibe_saludo) then
		creature:Emote(envia_saludo)
		creature:SendUnitSay("¡"..player:GetName().." alistaté en la marina!.", 0) -- saludo al objetivo
	else
		creature:SendUnitSay('Y tu que miras... camina!', 0)
	end
	  
end


function justine.OnDied( event, creature, killer)	
	creature:SendUnitSay('Por favor...Que me entierren con el vibrador entre las piernas!',0)	
end

RegisterCreatureEvent(justine.entry, 8, justine.OnReceiveEmote)
RegisterCreatureEvent(justine.entry, 4, justine.OnDied)
