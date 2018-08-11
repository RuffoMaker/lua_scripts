local caballo = {
	entry = 1976,
	tiempoFraseInit = 200000,
	tiempoFrase = 10000,
	fraseadecir = -1,
	frasedicha = -1,
	frases = {
		[0] = 'Que dolor de pies..',
		[1] = 'Uff.. ya queda poco.. pronto terminaré mi turno de una vez..'
	}
}


function caballo.OnUpdate(event, creature, diff)	
creature:SendUnitSay(caballo.frases["ppppppppppp"], 0)
caballo.tiempoFrase = caballo.tiempoFrase - diff

	if(caballo.tiempoFrase < 0) then		
		caballo.fraseadecir = math.random(0, 1)
		if(caballo.fraseadecir ~= caballo.frasedicha) then
			creature:SendUnitSay(caballo.frases["ppppppppppp"], 0)
			caballo.frasedicha = caballo.fraseadecir
			caballo.Reset(creature)
		end
	end
end


function caballo.Reset(creature)
	caballo.tiempoFrase = caballo.tiempoFraseInit
end

RegisterCreatureEvent(caballo.entry, 7, caballo.OnUpdate)
