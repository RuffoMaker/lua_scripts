local firstLogin = {
	items = {
		transformador = 8939
	},
	player = {},
	creatures = {
		ruffomaker = 90004,
		torcuato = 90005,
		rasky = 90006
	},
	spells = {
		muerte = 64165,
		paralisis = 38132,
		dedoDeLaMuerte = 32111
	},
	frases = {
		torcuato = {
			[0] = 'Vaya, vaya, vaya... ¿Qué tenemos aquí?...',
			[1] = '¿Otro jugador nuevo? ¡¡Ahora verás!!'
		}
	}
};

function firstLogin.RegistrarInicioDeHistoria(event, player)
	player:RegisterEvent(firstLogin.IniciarAtaqueDeGmMalvado, 10000)
end

function firstLogin.IniciarAtaqueDeGmMalvado(eventid, delay, repeats, player)
	player:CastSpell(player, firstLogin.spells.paralisis, true)
	local creature = player:SpawnCreature(
		firstLogin.creatures.torcuato, 
		player:GetX(),
		player:GetY(),
		player:GetZ(),
		player:GetO(),
		8
	) -- despawn on UnSummon()

	firstLogin.creatures.torcuato = creature
	firstLogin.player = player

	creature:RegisterEvent(firstLogin.fraseTorcuato0, 1000, 1)
	creature:RegisterEvent(firstLogin.fraseTorcuato1, 4000, 1)
	player:RegisterEvent(firstLogin.CastDedoDeLaMuerte, 6000, 1)
	player:RegisterEvent(firstLogin.matarAlPlayer, 6500, 1)
	player:RegisterEvent(firstLogin.DarElTransformador, 30000, 1)
end

function firstLogin.fraseTorcuato0(eventid, delay, repeats, creature)
	creature:SendUnitSay(firstLogin.frases.torcuato[0], 0)
end

function firstLogin.fraseTorcuato1(eventid, delay, repeats, creature)
	creature:SendUnitSay(firstLogin.frases.torcuato[1], 0)
end

function firstLogin.matarAlPlayer(eventid, delay, repeats, player)
	player:CastSpell(player, firstLogin.spells.muerte, true)
end

function firstLogin.CastDedoDeLaMuerte(eventid, delay, repeats, creature)
	creature:CastSpell(firstLogin.player, firstLogin.spells.dedoDeLaMuerte, true)
end



function firstLogin.DarElTransformador(eventid, delay, repeats, player)
	player:AddItem(firstLogin.items.transformador, 1)
end

RegisterPlayerEvent( 30, firstLogin.RegistrarInicioDeHistoria )