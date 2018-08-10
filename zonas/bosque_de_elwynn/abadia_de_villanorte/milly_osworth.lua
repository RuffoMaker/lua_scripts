local milly = {
	entry = 9296,
	tiempoFraseInit = 20000000,
	tiempoFrase = 10000,
	fraseadecir = -1,
	frasedicha = -1,
	frases = {
		[0] = '¡Trabajad más rapido panda de vagos!',
		[1] = 'Malditos trabajadores perezosos... así no hay quien cumpla encargos...',
		[2] = 'Dios.. que harta estoy de estos catetos...'
	}
}


function milly.OnUpdate(event, creature, diff)	
milly.tiempoFrase = milly.tiempoFrase - diff

	if(milly.tiempoFrase < 0) then		
		milly.fraseadecir = math.random(0, 2)
		if(milly.fraseadecir ~= milly.frasedicha) then
			creature:SendUnitSay(milly.frases[milly.fraseadecir], 0)
			milly.frasedicha = milly.fraseadecir
			milly.Reset(creature)
		end
	end
end


function milly.Reset(creature)
	milly.tiempoFrase = milly.tiempoFraseInit
end

RegisterCreatureEvent(milly.entry, 7, milly.OnUpdate)