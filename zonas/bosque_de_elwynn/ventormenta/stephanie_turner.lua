local Stephanie = {	
	entry = 6174,
	emoteSalto = 4,
	emoteBailar = 10,
	contador = 0,
	fraseContador = 10000,
	contadorFrase = 0,
	frases = {
		[0] = '¡Dale a tu cuerpo alegría macarena, que tu cuerpo es pa darle alegría y cosa buena!',
		[1] = '¡Dale a tu cuerpo alegría macarena.¡Eh macarena Ay!'
	}
};

--probando esto
function Stephanie.OnUpdate(event, creature, diff)	
	Stephanie.contador = Stephanie.contador + diff

	if(Stephanie.contador > Stephanie.fraseContador) then
		creature:Emote(Stephanie.emoteBailar)
		creature:SendUnitSay(Stephanie.frases[Stephanie.contadorFrase], 0)
		Stephanie.contadorFrase = Stephanie.contadorFrase + 1

		Stephanie.contador = 0
		Stephanie.fraseContador = 4000

		if(Stephanie.contadorFrase > 1) then
			Stephanie.Reset(creature)
		end

	end		

end

function Stephanie.Reset(creature)
	Stephanie.contadorFrase = 0
	Stephanie.fraseContador = 10000
	creature:Emote(0)
end

RegisterCreatureEvent(Stephanie.entry, 7, Stephanie.OnUpdate)
