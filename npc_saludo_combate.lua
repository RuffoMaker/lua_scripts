local entry = 31233

local contadorMordisco = 0
local tiempoMordisco = 3000
local mordisco = 41940

function saludar(event, creature, target)
	creature:SendUnitSay( '¡¡¡Wooooff woooof!!!', 0 )
end

function aiUpdate(event, creature, diff)

	target = creature:GetAITarget( 1, true )

	if(target ~= nil)then
		if(contadorMordisco > tiempoMordisco) then
			creature:CastSpell( target, mordisco, 1 )
			contadorMordisco = 0
		end
	end

	contadorMordisco = contadorMordisco + diff
end



RegisterCreatureEvent(entry, 1, saludar)

RegisterCreatureEvent(entry, 7, aiUpdate)