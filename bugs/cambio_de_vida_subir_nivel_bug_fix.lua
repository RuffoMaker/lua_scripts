function restaurarVida(event, player, oldLevel)
    player:SetHealth(player:GetMaxHealth())
    player:SetPower(127, player:GetMaxPower(0))
end

RegisterPlayerEvent(13, restaurarVida)