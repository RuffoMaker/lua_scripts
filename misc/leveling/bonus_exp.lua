local bonusExp = {
	rate = 10,
	chance = 50
};

function bonusExp.PlayerReceiveExp(event, player, amount, victim)
	local cantidad = 0
	if(math.random(0, 100) < bonusExp.chance) then
		player:SendBroadcastMessage('Has recibido un bonus de experiencia')
		cantidad = amount * bonusExp.rate
	else
		cantidad = amount
	end
	return cantidad
end

RegisterPlayerEvent(12, bonusExp.PlayerReceiveExp)