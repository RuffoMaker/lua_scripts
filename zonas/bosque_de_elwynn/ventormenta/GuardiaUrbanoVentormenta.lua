local guardiaUrbano = {
	entry = 1976,
	tiempoFraseInit = 10000,
	tiempoFrase = 10000,
	fraseadecir = -1,
	frasedicha = -1,
	frases = {
		[0] = 'Que dolor de pies..',
		[1] = 'Uff.. ya queda poco.. pronto terminaré mi turno de una vez..'
	}
}


function guardiaUrbano.OnUpdate(event, creature, diff)	
guardiaUrbano.tiempoFrase = guardiaUrbano.tiempoFrase - diff

	if(guardiaUrbano.tiempoFrase < 0) then		
		guardiaUrbano.fraseadecir = math.random(0, 1)
		if(fraseadecir ~= frasedicha) then
			creature:SendUnitSay(guardiaUrbano.frases[fraseadecir], 0)
			frasedicha = fraseadecir
			guardiaUrbano.Reset(creature)
		end
	end
end


function guardiaUrbano.Reset(creature)
	guardiaUrbano.tiempoFrase = guardiaUrbano.tiempoFraseInit
end

RegisterCreatureEvent(guardiaUrbano.entry, 7, guardiaUrbano.OnUpdate)