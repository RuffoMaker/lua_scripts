local setphanie = {	
	entry = 6174,
	emoteSalto = 4,
	emoteBailar = 10,
	emoteParada = 0
}

function setphanie.OnUpdate(event, creature, diff)	
	friendyUnits = creature:GetFriendlyUnitsInRange(10)
	if(friendyUnits ~= {})
		creature:Emote(emoteBailar) 
		creature:SendUnitSay("¡Dale a tu cuerpo alegría macarena, que tu cuerpo es pa'darle alegría y cosa buena!",0)
		creature:SendUnitSay("¡Dale a tu cuerpo alegría macarena.¡Eh macarena Ay!",0)
		creature:Emote(emoteSalto) 
		creature:Emote(emoteBailar)
		creature:SendUnitSay("¡Macarena tien un novio que se llama de apellido Vitorino, y en la jura de bandera del muchacho se la vió con dos amigos.Ay!",0)
		creature:SendUnitSay("¡Dale a tu cuerpo alegría macarena, que tu cuerpo es pa'darle alegría y cosa buena!",0)
		creature:SendUnitSay("¡Dale a tu cuerpo alegría macarena.¡Eh macarena Ay!",0)
		creature:Emote(emoteSalto) 
		creature:Emote(emoteBailar)
		creature:SendUnitSay("¡Macarena, Macarena, Macarena,Que le gustan los veranos de Marbella, Macarena, Macarena, Macarena, Que le gusta la movida guerrillera!",0)
		creature:SendUnitSay("¡Macarena sueña con El Corte Ingles, que se compra los modelos más modernos. Le gustaría vivir en Nueva York y ligar un novio nuevo!",0)
		creature:SendUnitSay("¡Dale a tu cuerpo alegría macarena, que tu cuerpo es pa'darle alegría y cosa buena!",0)
		creature:SendUnitSay("¡Dale a tu cuerpo alegría macarena.¡Eh macarena Ay!",0)
		creature:Emote(emoteSalto) 
		creature:Emote(emoteParada)
	end
end

RegisterCreatureEvent(setphanie.entry, 7, setphanie.OnUpdate)
