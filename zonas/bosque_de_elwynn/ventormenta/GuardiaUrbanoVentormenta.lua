local guardiaUrbano = {
	entry = 1976
}

function guardiaUrbano.OnUpdate(event, creature)	
		currTime = GetCurrTime()

		if(currTime % 2== 0)
			creature:SendUnitSay("Un poco más... pronto terminaré el turno de una vez..",0)
		end				
end

RegisterCreatureEvent(guardiaUrbano.entry, 5, guardiaUrbano.OnUpdate)