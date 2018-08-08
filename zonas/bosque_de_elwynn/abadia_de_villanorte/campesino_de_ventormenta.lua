local campesinoDeVentormenta = {
	entry = 11260,
	frases = {
		[0] = 'Árbol que no frutea, bueno es para leña.',
		[1] = 'Dicen que los leñadores somos diferentes al resto de humanos. ¡Estamos hechos de otra leña!',
		[2] = '¿Más trabajo?',
		[3] = '¿Qué es eso?',
		[4] = '¿Qué?',
		[5] = 'Uy, mosquis...',
	},
	tiempoFrase = 10000,
	tiempoFraseInit = 10000
};

function campesinoDeVentormenta.OnUpdate(event, creature, diff)
	campesinoDeVentormenta.tiempoFrase = campesinoDeVentormenta.tiempoFrase - diff

	if(campesinoDeVentormenta.tiempoFrase < 0) then
		creature:SendUnitSay(campesinoDeVentormenta.frases[math.random(0, 6)], 0)
		campesinoDeVentormenta.tiempoFrase = campesinoDeVentormenta.tiempoFraseInit
	end
end

RegisterCreatureEvent(campesinoDeVentormenta.entry, 7, campesinoDeVentormenta.OnUpdate)



