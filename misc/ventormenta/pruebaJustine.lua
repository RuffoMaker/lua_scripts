local justine = {
	recibe_hola = 101,
	recibe_saludo = 78,
	envia_saludo = 66,
	entry = 12481
}

function justine.OnReceiveEmote(evente, creature, player, emoteid)
	if(emoteid == justine.recibe_hola) then
		creature:SendUnitSay("Aloooo",7)
	elseif(emoteid == justine.recibe_saludo) then
		creature:Emote(justine.envia_saludo)
	end

end

RegisterCreatureEvent(justine.entry,8,justine.OnReceiveEmote)