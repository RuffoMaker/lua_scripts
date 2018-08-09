local bonusExp = {
	rateMin = 2,
	rateMax = 50,
	chance = 80
};

function bonusExp.PlayerReceiveExp(event, player, amount, victim)
	local cantidad = 0
	if(math.random(0, 100) < bonusExp.chance) then
		local rand = tonumber(math.random(bonusExp.rateMin, bonusExp.rateMax))
		player:SendBroadcastMessage('Has recibido un bonus de experiencia de un x'..rand)
		--cantidad = amount * rand
	else
		cantidad = amount
	end
	--return cantidad
end

RegisterPlayerEvent(12, bonusExp.PlayerReceiveExp)