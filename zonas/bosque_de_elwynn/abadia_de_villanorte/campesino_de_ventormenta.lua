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
	tiempoFraseInit = 10000,
};

function campesinoDeVentormenta.OnUpdate(event, creature, diff)

end

RegisterCreatureEvent(campesinoDeVentormenta.entry, 7, campesinoDeVentormenta.OnUpdate)



