local items = {
	transformador = 8939
};

local distancia = 10
local angulo = 0.25
local altura = 2

local creatures = {
	ruffomaker = 90004,
	torcuato = 90005,
	rasky = 90006
};

local spells = {
	muerte = 64165,
	paralisis = 38132,
	dedoDeLaMuerte = 47848,
	teleport = 64446,
	visualRes = 70571
}

local frases = {
	torcuato = {
		[0] = 'Vaya, vaya, vaya... ¿Qué tenemos aquí?...',
		[1] = '¿Otro jugador nuevo? ¡¡Ahora verás!!',
		[2] = 'JAJAJAJA',
		[3] = 'JAJAJAJA ¡¡Primero tendréis que capturarme!!',
	},
	rasky = {
		[0] = '¡¡Torcuato!! ¡¡Maldito seas!!',
		[1] = 'Somos los creadores de WoW Saron',
		[2] = 'Tanto poder lo corrompió y ahora está modificando el servidor para hacer el mal.',
		[3] = 'Es un objeto que te permite en ocasiones especiales capturar el alma de algunos enemigos y poder transformarte en ellos.',
		[4] = '¡¡Nos vemos!!',
	},
	ruffomaker = {
		[0] = '¡¡Vas a pagar por todo esto!!',
		[1] = 'Siento mucho lo que ha sucedido...',
		[2] = 'Me presento, soy RuffoMaker y el es Rasky',
		[3] = 'Antes de nada, vamos a resucitarte.',
		[4] = 'Torcuato fue uno de nuestros GM más poderosos.',
		[5] = 'Vamos a darte por las molestias este Transformador.',
		[6] = 'Si tienes cualquier duda, puedes escribirnos un ticket.'
	}
};

function RegistrarInicioDeHistoria(event, player)
	player:RegisterEvent(IniciarAtaqueDeGmMalvado, 10000)
end

function IniciarAtaqueDeGmMalvado(eventid, delay, repeats, player)
	player:CastSpell(player, spells.paralisis, true)
	local torcuato = player:SpawnCreature(
		creatures.torcuato, 
		player:GetX() + (math.cos(player:GetO()) * distancia),
		player:GetY() + (math.sin(player:GetO()) * distancia),
		player:GetZ() + altura,
		OrientacionContraria(player:GetO()),
		8
	) -- despawn on UnSummon()

	torcuato:CastSpell(creature, spells.teleport, true)

	torcuato:RegisterEvent(fraseTorcuato0, 1000, 1)
	torcuato:RegisterEvent(fraseTorcuato1, 4000, 1)
	torcuato:RegisterEvent(CastDedoDeLaMuerte, 6000, 1)
	torcuato:RegisterEvent(fraseTorcuato2, 8000, 1)
	torcuato:RegisterEvent(fraseTorcuato3, 16000, 1)
	torcuato:RegisterEvent(torcuatoDesaparece, 19000, 1)

	torcuato:RegisterEvent(apareceRuffo, 8500, 1)
	torcuato:RegisterEvent(apareceRasky, 9500, 1)

	player:RegisterEvent(matarAlPlayer, 6500, 1)
	player:RegisterEvent(PonerVisualRes, 30000, 1)
	player:RegisterEvent(QuitarVisualRes, 33000, 1)
	player:RegisterEvent(DarElTransformador, 40000, 1)
end

function PonerVisualRes(eventid, delay, repeats, player)
	player:CastSpell(player, spells.visualRes, true)
end

function QuitarVisualRes(eventid, delay, repeats, player)
	player:RemoveAura(spells.visualRes)
	player:RemoveAura(spells.muerte)
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

function fraseTorcuato3(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.torcuato[3], 0)
end

function matarAlPlayer(eventid, delay, repeats, player)
	player:CastSpell(player, spells.muerte, true)
end

function CastDedoDeLaMuerte(eventid, delay, repeats, creature)
	nearestPlayer = creature:GetNearestPlayer( 20 )
	creature:CastSpell(nearestPlayer, spells.dedoDeLaMuerte, false)
end

function torcuatoDesaparece(eventid, delay, repeats, creature)
	creature:CastSpell(creature, spells.teleport, true)
	creature:DespawnOrUnsummon(1000)
end



function apareceRuffo(eventid, delay, repeats, creature)
	local ruffomaker = creature:SpawnCreature(
		creatures.ruffomaker, 
		creature:GetX() + (math.cos(RestarOrientacion(creature:GetO(), angulo)) * distancia),
		creature:GetY() + (math.sin(RestarOrientacion(creature:GetO(), angulo)) * distancia),
		creature:GetZ() + altura,
		OrientacionContraria(creature:GetO()),
		8
	) -- despawn on UnSummon()

	ruffomaker:CastSpell(ruffomaker, spells.teleport, false)

	ruffomaker:RegisterEvent(fraseRuffomaker0, 6000)
	ruffomaker:RegisterEvent(fraseRuffomaker1, 13000)
	ruffomaker:RegisterEvent(fraseRuffomaker2, 15000)
	ruffomaker:RegisterEvent(fraseRuffomaker3, 20000)
	ruffomaker:RegisterEvent(fraseRuffomaker4, 26000)
	ruffomaker:RegisterEvent(fraseRuffomaker5, 30000)
	ruffomaker:RegisterEvent(fraseRuffomaker6, 35000)
	ruffomaker:RegisterEvent(RuffoSeVa, 37000)
end

function apareceRasky(eventid, delay, repeats, creature)
	local rasky = creature:SpawnCreature(
		creatures.rasky, 
		creature:GetX() + (math.cos(RestarOrientacion(creature:GetO(), -angulo)) * distancia),
		creature:GetY() + (math.sin(RestarOrientacion(creature:GetO(), -angulo)) * distancia),
		creature:GetZ() + altura,
		OrientacionContraria(creature:GetO()),
		8
	) -- despawn on UnSummon()

	rasky:CastSpell(ruffomaker, spells.teleport, false)

	rasky:RegisterEvent(fraseRasky0, 3000)
	rasky:RegisterEvent(fraseRasky1, 16500)
	rasky:RegisterEvent(fraseRasky2, 27000)
	rasky:RegisterEvent(fraseRasky3, 31000)
	rasky:RegisterEvent(fraseRasky4, 35000)
	rasky:RegisterEvent(RaskySeVa, 37000)
end

function fraseRasky0(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.rasky[0], 0)
end

function fraseRasky1(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.rasky[1], 0)
end

function fraseRasky2(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.rasky[2], 0)
end

function fraseRasky3(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.rasky[3], 0)
end

function fraseRasky4(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.rasky[4], 0)
end

function RaskySeVa(eventid, delay, repeats, creature)
	creature:CastSpell(creature, spells.teleport, true)
	creature:DespawnOrUnsummon(1000)
end



function fraseRuffomaker0(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.ruffomaker[0], 0)
end

function fraseRuffomaker1(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.ruffomaker[1], 0)
end

function fraseRuffomaker2(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.ruffomaker[2], 0)
end

function fraseRuffomaker3(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.ruffomaker[3], 0)
end

function fraseRuffomaker4(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.ruffomaker[4], 0)
end

function fraseRuffomaker5(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.ruffomaker[5], 0)
end

function fraseRuffomaker6(eventid, delay, repeats, creature)
	creature:SendUnitSay(frases.ruffomaker[6], 0)
end

function RuffoSeVa(eventid, delay, repeats, creature)
	creature:CastSpell(creature, spells.teleport, true)
	creature:DespawnOrUnsummon(1000)
end



function DarElTransformador(eventid, delay, repeats, player)
	player:RemoveAura(spells.paralisis)
	player:AddItem(items.transformador, 1)
end

function OrientacionContraria(orientacion)
	orientacion = orientacion - (6.25 / 2)
	if(orientacion < 0) then
		orientacion = orientacion + 6.25
	end
	return orientacion
end

function RestarOrientacion(orientacion, resta)
	orientacion = orientacion - resta
	if(orientacion < 0) then
		orientacion = orientacion + 6.25
	end
	return orientacion
end

RegisterPlayerEvent( 30, RegistrarInicioDeHistoria )