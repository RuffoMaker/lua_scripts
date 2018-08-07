local entry = 12481

local contadorMordisco = 0
local tiempoMordisco = 3000
local mordisco = 41940

function saludar(event, creature, target)
	creature:SendUnitSay( 'Juan donde esta mi maldicho Chorizo portuano para mi ano!.', 0 )
	creature:Emote(14)

end

function aiUpdate(event, creature, diff)

	target = creature:GetAITarget( 1, true )

	if(target ~= nil) then
		if(contadorMordisco > tiempoMordisco) then
			creature:CastSpell( target, mordisco, 1 )
			contadorMordisco = 0
		end
	end

	contadorMordisco = contadorMordisco + diff
end



RegisterCreatureEvent(entry, 8, saludar)

--RegisterCreatureEvent(entry, 7, aiUpdate)