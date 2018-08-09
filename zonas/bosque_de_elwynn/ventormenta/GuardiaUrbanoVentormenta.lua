local guardiaUrbano = {
	entry = 1976
}

function guardiaUrbano.OnUpdate(event, creature)			
		if(creature:isStopped() ==true) then
			creature:SendUnitSay("Uf..ya queda poco... pronto terminaré el turno de una vez..",0)
		end				
end

RegisterCreatureEvent(guardiaUrbano.entry, 5, guardiaUrbano.OnUpdate)