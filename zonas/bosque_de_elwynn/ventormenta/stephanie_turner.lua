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

function Stephanie.OnSpawn(event, creature)	
		creature:Emote(Stephanie.emoteBailar) 		
end

--probando esto
function Stephanie.OnUpdate(event, creature, diff)	
	Stephanie.contador = Stephanie.contador + diff

	if(Stephanie.contador > Stephanie.fraseContador) then
		creature:SendUnitSay(Stephanie.frases[contadorFrase], 0)
		Stephanie.contadorFrase = Stephanie.contadorFrase + 1

		Stephanie.contador = 0
		Stephanie.fraseContador = 4000

		if(Stephanie.contadorFrase > 1) then
			Stephanie.contadorFrase = 0
			Stephanie.fraseContador = 10000
		end

	end		

end



RegisterCreatureEvent(Stephanie.entry, 5, Stephanie.OnSpawn)
RegisterCreatureEvent(Stephanie.entry, 7, Stephanie.OnUpdate)
