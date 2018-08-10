local firstLogin = {
	items = {
		transformador = 8939
	},
	creatures = {
		ruffomaker = 90004
	}
};

function firstLogin.RegistrarInicioDeHistoria(event, player)
	player:RegisterEvent(firstLogin.IniciarAtaqueDeGmMalvado, 60000)
end

function firstLogin.IniciarAtaqueDeGmMalvado(eventid, delay, repeats, player)
	creature = player:SpawnCreature( firstLogin.creatures.ruffomaker, player:GetX(), player:GetY, player:GetZ(), player:GetO(), 8 ) -- despawn on UnSummon()
end

RegisterPlayerEvent( 30, firstLogin.RegistrarInicioDeHistoria )