local function OnDied(event, creature, killer)
    creature.SendUnitSay('Hijo de puta...', 1)
end

RegisterCreatureEvent(883, 4, OnDied)