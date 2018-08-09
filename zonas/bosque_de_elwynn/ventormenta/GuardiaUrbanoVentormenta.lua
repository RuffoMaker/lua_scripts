local guardiaUrbano = {
	entry = 1976,
	contador = 0
}


function guardiaUrbano.OnUpdate(event, creature, diff)	
	guardiaUrbano.contador = guardiaUrbano.contador +diff
	if(guardiaUrbano.contador ==15000) then
		creature:SendUnitSay("Uf..ya queda poco... pronto terminaré el turno de una vez..",0)
		guardiaUrbano.contador = 0
	end

end

-- RegisterCreatureEvent(guardiaUrbano.entry, 5, guardiaUrbano.OnSpawn)
RegisterCreatureEvent(guardiaUrbano.entry, 7, guardiaUrbano.OnUpdate)