local levelScalingSystem = {};

function levelScalingSystem.CreatureSetLevel(event, player, enemy) {
	if(enemy:GetObjectType() == "Creature") then
		enemy:SetLevel(player:GetLevel())
	end
}

RegisterPlayerEvent(33, levelScalingSystem.CreatureSetLevel)