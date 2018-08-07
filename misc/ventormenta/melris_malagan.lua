local function OnDied(event, creature, killer)
  if(killer:GetObjectType() == "Player") then
    killer:SendBroadcastMessage("You killed " ..creature:GetName().."!")
  end
end

local function OnUpdate(event, creature, diff)
  creature:SendUnitYell("Haha, I'm out of combat!", 0)
end

RegisterCreatureEvent(883, 4, OnDied)