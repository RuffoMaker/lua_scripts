local varian = {
	entry = 29611
};

function varian.OnCombat(event, creature, target)
	creature:SendUnitSay('Já no m orire hasta legión!.', 0)
end

RegisterCreatureEvent(varian.entry, 1, varian.OnCombat)