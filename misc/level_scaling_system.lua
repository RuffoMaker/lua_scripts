local levelScalingSystem = {};

function levelScalingSystem.CreatureSetLevel(event, player, enemy)
	enemy:SendUnitSay('Hola puto', 0)
	--if(enemy:GetObjectType() == "Creature") then
		--enemy:SetLevel(80)
	--end
end

RegisterPlayerEvent(33, levelScalingSystem.CreatureSetLevel)