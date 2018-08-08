local levelScalingSystem = {};

function levelScalingSystem.CreatureSetLevel(event, player, enemy)
	player:SendBroadcastMessage('Hola puto')
	--if(enemy:GetObjectType() == "Creature") then
		enemy:SetLevel(80)
	--end
end

RegisterPlayerEvent(33, levelScalingSystem.CreatureSetLevel)