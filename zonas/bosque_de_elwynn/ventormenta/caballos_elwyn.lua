local caballo = {
	entry = 5403,
	tiempoFraseInit = 200000,
	tiempoFrase = 10000,
	fraseadecir = -1,
	frasedicha = -1,
	frases = {
		[0] = 'hiiii',
		[1] = '¡frrrrrrrr!',
		[2] = '¡Hola puto!'
	}
}


function caballo.OnUpdate(event, creature, diff)	
caballo.tiempoFrase = caballo.tiempoFrase - diff

	if(caballo.tiempoFrase < 0) then		
		caballo.fraseadecir = math.random(0, 1)
		if(caballo.fraseadecir ~= caballo.frasedicha) then
			if(caballo.fraseadecir == 0) then
				creature:SendUnitSay(caballo.frases[0], 0)
			end

			if(caballo.fraseadecir == 1) then
				creature:SendUnitSay(caballo.frases[1], 0)
			end

			if(caballo.fraseadecir == 2) then
				creature:SendUnitSay(caballo.frases[2], 0)
			end

			caballo.frasedicha = caballo.fraseadecir
			caballo.Reset(creature)
		end
	end
end


function caballo.Reset(creature)
	caballo.tiempoFrase = caballo.tiempoFraseInit
end

RegisterCreatureEvent(caballo.entry, 7, caballo.OnUpdate)