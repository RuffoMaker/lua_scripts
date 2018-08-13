local filcaun = {
	sumatorioDetiempo = 0,
	tiempoHastaInicio = 1000,
	contadorCiclos = 0,
	emoteHablar = 93,
	emoteNohaceNada = 0

}

function filcaun.OnUpdate(event, creature, diff)
	creature:SendUnitSay(diff,0)
end


RegisterCreatureEvent(80500, 7, filcaun.OnUpdate)