local npcEntry = 31847

local function cuandoEntraEnCombate(event, creature, target)
	creature:SendUnitYell( msg, 0 )
end

RegisterCreatureEvent( npcEntry, 1, cuandoEntraEnCombate )