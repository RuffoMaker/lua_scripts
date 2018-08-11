function onUpdateZone(event, player, newZone, newArea)
	player:SetFFA(true)
	player:SendUnitSay('.reload all', 0)
end

RegisterPlayerEvent(27, onUpdateZone)