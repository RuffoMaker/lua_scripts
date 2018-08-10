local items = {
	transformador = 8939
};

local player = {};

local creatures = {
	ruffomaker = 90004,
	torcuato = 90005,
	rasky = 90006
};

local spells = {
	muerte = 64165,
	paralisis = 38132,
	dedoDeLaMuerte = 32111
}

local frases = {
	torcuato = {
		[0] = 'Vaya, vaya, vaya... ¿Qué tenemos aquí?...',
		[1] = '¿Otro jugador nuevo? ¡¡Ahora verás!!'
	}
};

local function RegistrarInicioDeHistoria(event, player)
	player:RegisterEvent(IniciarAtaqueDeGmMalvado, 10000)
end

local function IniciarAtaqueDeGmMalvado(eventid, delay, repeats, player)
	player:CastSpell(player, spells.paralisis, true)
	local creature = player:SpawnCreature(
		creatures.torcuato, 
		player:GetX(),
		player:GetY(),
		player:GetZ(),
		player:GetO(),
		8
	) -- despawn on UnSummon()

	creatures.torcuato = creature
	player = player

	creature:RegisterEvent(fraseTorcuato0, 1000, 1)
	creature:RegisterEvent(fraseTorcuato1, 4000, 1)
	player:RegisterEvent(CastDedoDeLaMuerte, 6000, 1)
	player:RegisterEvent(matarAlPlayer, 6500, 1)
	player:RegisterEvent(DarElTransformador, 30000, 1)
end

local function fraseTorcuato0(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.torcuato[0], 0)
end

local function fraseTorcuato1(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.torcuato[1], 0)
end

local function matarAlPlayer(eventid, delay, repeats, player)
	player:CastSpell(player, spells.muerte, true)
end

local function CastDedoDeLaMuerte(eventid, delay, repeats, creature)
	creature:CastSpell(player, spells.dedoDeLaMuerte, false)
end



local function DarElTransformador(eventid, delay, repeats, player)
	player:AddItem(items.transformador, 1)
end

RegisterPlayerEvent( 30, RegistrarInicioDeHistoria )