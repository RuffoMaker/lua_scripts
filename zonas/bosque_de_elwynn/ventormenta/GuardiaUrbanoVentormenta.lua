local guardiaUrbano = {
	entry = 1976
}

function guardiaUrbano.OnSpawn(event, creature)
	creature:RegisterEvent(guardiaUrbano.Hablar, {0, 10000}, 0)
end

function guardiaUrbano.Hablar(eventid, delay, repeats, creature)
	if(creature:IsStopped() == true) then
		creature:SendUnitSay("Uf..ya queda poco... pronto terminaré el turno de una vez..",0)
	end
end

RegisterCreatureEvent(guardiaUrbano.entry, 5, guardiaUrbano.OnUpdate)