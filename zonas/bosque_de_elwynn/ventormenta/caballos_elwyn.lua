local caballo = {
	entry = 5403,
	tiempoFraseInit = 120000,
	tiempoFrase = 10000,
	fraseadecir = -1,
	frasedicha = -1,
	frases = {
		[0] = 'hiiii',
		[1] = '¡frrrrrrrr!'
	}
}


function caballo.OnUpdate(event, creature, diff)	
caballo.tiempoFrase = caballo.tiempoFrase - diff

	if(caballo.tiempoFrase < 0) then		
		caballo.fraseadecir = math.random(0, 1)
		if(caballo.fraseadecir ~= caballo.frasedicha) then
			creature:SendUnitSay(caballo.frases[caballo.fraseadecir], 0)
			caballo.frasedicha = caballo.fraseadecir
			caballo.Reset(creature)
		end
	end
end


function caballo.Reset(creature)
	caballo.tiempoFrase = caballo.tiempoFraseInit
end

RegisterCreatureEvent(caballo.entry, 7, caballo.OnUpdate)