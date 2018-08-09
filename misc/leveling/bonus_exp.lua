local bonusExp = {
	rateMin = 2,
	rateMax = 50,
	chance = 20
};

function bonusExp.PlayerReceiveExp(event, player, amount, victim)
	local cantidad = 0
	if(math.random(0, 100) < bonusExp.chance) then
		player:SendBroadcastMessage('Has recibido un bonus de experiencia')
		cantidad = amount * math.random(bonusExp.rateMin, bonuxExp.rateMax)
	else
		cantidad = amount
	end
	return cantidad
end

RegisterPlayerEvent(12, bonusExp.PlayerReceiveExp)