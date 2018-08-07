local TopperMcNabb = {
	entry = 1402,
	frases = {
		[0] = 'Te prometo que el martes te pago lo que me des hoy para una hamburguesa.',
		[1] = '¿Te sobra algo de morralla para un pobre ciego?... ¿Qué quieres decir con que no soy ciego?... ¡YA NO SOY CIEGO! ¡¡PUEDO VER!! ¡ES UN MILAGRO!',
		[2] = 'Lustro vuestra armadura por una monedita de cobre.',
		[3] = '¿Me podrías dar alguna moneda?',
		[4] = 'Todo es culpa del maldito ejército de la Alianza... Tenían que construir sus torres justo detrás de mi granja.',
		[5] = 'Todo es culpa de los estúpidos orcos. Tenían que quemar mi granja hasta los cimientos.',
		[6] = '¿Una limosna para los pobres?'
	},
	tiempoFrase = 180000,
	emoteRasp = 183,
	emoteRude = 77
};

function TopperMcNabb.OnEmote(event, creature, player, emoteid)
	if(emoteid == TopperMcNabb.emoteRasp) then
		TopperMcNabb.StartCombat(creature, player)
	else
		creature:SendUnitSay(TopperMcNabb.frases[random(0, 6)], 0)
	end
end

function TopperMcNabb.OnLeaveCombat(event, creature)
	TopperMcNabb.Reset(creature)
end

function TopperMcNabb.OnDie(event, creature, killer)
	TopperMcNabb.Reset(creature)
end

function TopperMcNabb.Reset(creature)
	creature:RemoveEvents()
	creature:SetLevel(1)
	creature:SetFaction(35)
end

function TopperMcNabb.StartCombat(creature, player)
	creature:Emote(TopperMcNabb.emoteRasp)
	creature:SendUnitSay('¿Como? ¡¡TE VAS A ENTERAR!!', 0)
	creature:SetLevel(255)
	creature:SetFaction(14)
	creature:AttackStart(player)
end

RegisterCreatureEvent(TopperMcNabb.entry, 8, TopperMcNabb.OnEmote)
RegisterCreatureEvent(TopperMcNabb.entry, 2, TopperMcNabb.OnLeaveCombat)
RegisterCreatureEvent(TopperMcNabb.entry, 4, TopperMcNabb.OnDie)


