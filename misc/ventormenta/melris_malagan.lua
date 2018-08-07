local function OnDied(event, creature, killer)
    if(killer:GetObjectType() == "Player") then
        killer:SendBroadcastMessage("You killed " ..creature:GetName().."!")
    end
end

RegisterCreatureEvent(883, 4, OnDied)