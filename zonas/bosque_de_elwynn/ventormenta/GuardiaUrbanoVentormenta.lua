local guardiaUrbano = {
	entry = 1976,
	contador = 0,	-- inicio de contador
	maxcontador = 10000, -- tiempo maximo
	contadorfrases = 0, -- indice o numero de frase que toca
	frases = {
		[0] = 'Que dolor de pies..',
		[1] = 'Uff.. ya queda poco.. pronto terminaré mi turno de una vez..'
	}
}


function guardiaUrbano.OnUpdate(event, creature, diff)	

	guardiaUrbano.contador = guardiaUrbano.contador +diff

	if(guardiaUrbano.contador > guardiaUrbano.maxcontador) then

		if(guardiaUrbano.contadorfrases < 1)then
			creature:SendUnitSay(guardiaUrbano.frases[guardiaUrbano.contadorfrases],0)
			guardiaUrbano.contadorfrases = guardiaUrbano.contadorfrases + 1
			guardiaUrbano.maxcontador = 4000
		elseif(guardiaUrbano.contadorfrases > 0) then
			creature:SendUnitSay(guardiaUrbano.frases[guardiaUrbano.contadorfrases],0)
			guardiaUrbano.Reset(creature)
		end	

end


function guardiaUrbano.Reset(creature)
	guardiaUrbano.contadorfrases = 0
	guardiaUrbano.maxcontador = 300000
end

RegisterCreatureEvent(guardiaUrbano.entry, 7, guardiaUrbano.OnUpdate)