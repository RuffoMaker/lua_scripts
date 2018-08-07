local justineDemalier = {
	recibe_hola = 101,
	recibe_saludo = 78,
	envia_saludo = 66,
	entry = 12481
};

function justineDemalier.saludar(event, creature, player, emoteid)
	if(emoteid == justineDemalier.recibe_hola) then
		creature:SendUnitSay("Aloooo",0)
	elseif(emoteid == justineDemalier.recibe_saludo) then
		creature:Emote(justineDemalier.envia_saludo)
	else
		creature:SendUnitSay('Ese emote no me gusta.', 0)
	end
end

RegisterCreatureEvent(justineDemalier.entry, 8, justineDemalier.saludar)

