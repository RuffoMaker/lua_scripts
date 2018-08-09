local guardiaUrbano = {
	entry = 1976,
	tiempoFraseInit = 10000,
	tiempoFrase = 10000,
	frases = {
		[0] = 'Que dolor de pies..',
		[1] = 'Uff.. ya queda poco.. pronto terminaré mi turno de una vez..'
	}
}


function guardiaUrbano.OnUpdate(event, creature, diff)	
guardiaUrbano.tiempoFrase = guardiaUrbano.tiempoFrase - diff

	if(guardiaUrbano.tiempoFrase < 0) then
		creature:SendUnitSay(guardiaUrbano.frases[math.random(0, 1)], 0)
		guardiaUrbano.Reset(creature)
	end
end


function guardiaUrbano.Reset(creature)
	guardiaUrbano.tiempoFrase = guardiaUrbano.tiempoFraseInit
end

RegisterCreatureEvent(guardiaUrbano.entry, 7, guardiaUrbano.OnUpdate)