local guardiaUrbano = {
	entry = 1976,
	contador = 0,
	maxcontador = 10000,
	contadorfrases = 0,
	frases ={
		[0] = 'Que dolor de pies..',
		[1] = 'Uff.. ya queda poco.. pronto terminaré mi turno de una vez..'
	}
}


function guardiaUrbano.OnUpdate(event, creature, diff)	
	guardiaUrbano.contador = guardiaUrbano.contador +diff
	if(guardiaUrbano.contador > guardiaUrbano.maxcontador and guardiaUrbano.contadorfrases>0) then
		creature:SendUnitSay(guardiaUrbano.frases[guardiaUrbano.contadorfrases],0)
		guardiaUrbano.contadorfrases = guardiaUrbano.contadorfrases + 1
		guardiaUrbano.maxcontador = 4000
	elseif(guardiaUrbano.contadorfrases > guardiaUrbano.maxcontador and guardiaUrbano.contadorfrases == 1)
		creature:SendUnitSay(guardiaUrbano.frases[guardiaUrbano.contadorfrases],0)
		guardiaUrbano.Reset(creature)
	end


end


function guardiaUrbano.Reset(creature)
	guardiaUrbano.contadorfrases = 0
	guardiaUrbano.maxcontador = 300000
end

RegisterCreatureEvent(guardiaUrbano.entry, 7, guardiaUrbano.OnUpdate)