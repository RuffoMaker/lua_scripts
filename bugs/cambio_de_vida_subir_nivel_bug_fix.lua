-- BUG EN EL QUE AL SUBIR DE NIVEL NO TE PONE LA VIDA AL MAXIMO

function restaurarVida(event, player, oldLevel)
    player:SetHealth(player:GetMaxHealth())
    player:SetPower(127, player:GetMaxPower(0))
end

RegisterPlayerEvent(13, restaurarVida)