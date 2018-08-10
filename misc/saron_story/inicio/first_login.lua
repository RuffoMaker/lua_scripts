local items = {
	transformador = 8939
};

local creatures = {
	ruffomaker = 90004,
	torcuato = 90005,
	rasky = 90006
};

local spells = {
	muerte = 64165,
	paralisis = 38132,
	dedoDeLaMuerte = 47848
}

local frases = {
	torcuato = {
		[0] = 'Vaya, vaya, vaya... ¿Qué tenemos aquí?...',
		[1] = '¿Otro jugador nuevo? ¡¡Ahora verás!!',
		[2] = 'JAJAJAJA'
	}
};

function RegistrarInicioDeHistoria(event, player)
	player:RegisterEvent(IniciarAtaqueDeGmMalvado, 10000)
end

function IniciarAtaqueDeGmMalvado(eventid, delay, repeats, player)
	player:CastSpell(player, spells.paralisis, true)
	local torcuato = player:SpawnCreature(
		creatures.torcuato, 
		player:GetX() + (math.cos(player:GetO()) * 3),
		player:GetY() + (math.sin(player:GetO()) * 3),
		player:GetZ(),
		player:GetO(),
		8
	) -- despawn on UnSummon()

	torcuato:RegisterEvent(fraseTorcuato0, 1000, 1)
	torcuato:RegisterEvent(fraseTorcuato1, 4000, 1)
	torcuato:RegisterEvent(CastDedoDeLaMuerte, 6000, 1)
	torcuato:RegisterEvent(fraseTorcuato2, 8000, 1)

	torcuato:RegisterEvent(apareceRuffo, 8500, 1)
	torcuato:RegisterEvent(apareceRasky, 9500, 1)

	player:RegisterEvent(matarAlPlayer, 6500, 1)
	player:RegisterEvent(DarElTransformador, 30000, 1)
end

function fraseTorcuato0(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.torcuato[0], 0)
end

function fraseTorcuato1(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.torcuato[1], 0)
end

function fraseTorcuato2(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.torcuato[2], 0)
end

function matarAlPlayer(eventid, delay, repeats, player)
	player:CastSpell(player, spells.muerte, true)
end

function CastDedoDeLaMuerte(eventid, delay, repeats, creature)
	nearestPlayer = creature:GetNearestPlayer( 20 )
	creature:CastSpell(nearestPlayer, spells.dedoDeLaMuerte, false)
end



function apareceRuffo(eventid, delay, repeats, creature)
	local ruffomaker = creature:SpawnCreature(
		creatures.ruffomaker, 
		creature:GetX() + (math.cos(creature:GetO() + 1) * 3),
		creature:GetY() + (math.sin(creature:GetO() + 1) * 3),
		creature:GetZ(),
		creature:GetO(),
		8
	) -- despawn on UnSummon()
end

function apareceRasky(eventid, delay, repeats, creature)
	local rasky = creature:SpawnCreature(
		creatures.rasky, 
		creature:GetX() + (math.cos(creature:GetO() - 1) * 3),
		creature:GetY() + (math.sin(creature:GetO() - 1) * 3),
		creature:GetZ(),
		creature:GetO(),
		8
	) -- despawn on UnSummon()
end



function DarElTransformador(eventid, delay, repeats, player)
	player:AddItem(items.transformador, 1)
end

RegisterPlayerEvent( 30, RegistrarInicioDeHistoria )