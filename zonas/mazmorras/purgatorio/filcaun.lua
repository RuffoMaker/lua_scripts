local filcaun = {
	sumatorioDetiempo = 0,
	tiempoHastaInicio = 1000,
	contadorCiclos = 0,
	emoteHablar = 93,
	emoteNohaceNada = 0

}

function filcaun.OnUpdate(event, creature, diff)
	filcaun.sumatorioDetiempo = filcaun.sumatorioDetiempo + diff

	if(filcaun.tiempoHastaInicio < filcaun.sumatorioDetiempo) then
		creature:SendUnitSay("hola",0)
		filcaun.sumatorioDetiempo = 0
	end
	
end


RegisterCreatureEvent(80500, 7, filcaun.OnUpdate)