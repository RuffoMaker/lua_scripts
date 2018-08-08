local function Start (event, player, command)
	if (command == "st" or command == "start") then
		if (player:IsInCombat() == true) then
			player:SendNotification("Estás en combate.")
		else
			player:ResetSpellCooldown(7355)
			player:CastSpell(player, 7355, false)
		end
	end
end

RegisterPlayerEvent(42, Start)