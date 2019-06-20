local entry=29611;

function varian.OnCombat(event,creature,target)
	creature:SendUnitSay('Já no m orire hasta legión!.',0)
	creature:AttackStart(target)
end
RegisterCreatureEvent(entry,1,varian.OnCombat)