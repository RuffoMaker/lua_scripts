local TopperMcNabb = {
	entry = 1402,
	frases = {
		'Te prometo que el martes te pago lo que me des hoy para una hamburguesa.',
		'¿Te sobra algo de morralla para un pobre ciego?... ¿Qué quieres decir con que no soy ciego?... ¡YA NO SOY CIEGO! ¡¡PUEDO VER!! ¡ES UN MILAGRO!',
		'Lustro vuestra armadura por una monedita de cobre.',
		'¿Me podrías dar alguna moneda?',
		'Todo es culpa del maldito ejército de la Alianza... Tenían que construir sus torres justo detrás de mi granja.',
		'Todo es culpa de los estúpidos orcos. Tenían que quemar mi granja hasta los cimientos.',
		'¿Una limosna para los pobres?'
	},
	tiempoFrase = 180000,
	emoteRasp = 14
};

function TopperMcNabb.OnEmote(event, creature, player, emoteid)
	creature:SendUnitSay('Guapo', 0)
	if(emoteid == TopperMcNabb.emoteRasp) then -- emote rasp
		creature:Emote(TopperMcNabb.emoteRasp)
		creature:SendUnitSay('¿Como? ¡¡TE VAS A ENTERAR!!', 0)
		creature:SetLevel(255)
	end
end

RegisterCreatureEvent(TopperMcNabb.entry, 8, TopperMcNabb.OnEmote) -- on emote