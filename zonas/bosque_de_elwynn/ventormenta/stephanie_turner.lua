local setphanie = {	
	entry = 6174,
	emoteSalto = 4,
	emoteBailar = 10
}

function setphanie.OnSpawn(event, creature)	
		creature:Emote(setphanie.emoteBailar) 		
end

--probando esto
function setphanie.OnUpdate(event, creature, diff)	
	local contador = 0
	local maxcontador = 15000
	contador = contador+diff
	for i=contador,maxcontador do
		if(contador == 10000) then
			creature:SendUnitSay("¡Dale a tu cuerpo alegría macarena, que tu cuerpo es pa'darle alegría y cosa buena!",0)
		elseif(contador==14000)
			creature:SendUnitSay("¡Dale a tu cuerpo alegría macarena.¡Eh macarena Ay!",0)
			creature:Emote(setphanie.emoteSalto) 
		end
		contador = contador +diff
	end
		contador = 0
		creature:Emote(setphanie.emoteBailar)			
end



-- RegisterCreatureEvent(setphanie.entry, 5, setphanie.OnSpawn)
RegisterCreatureEvent(setphanie.entry, 7, setphanie.OnUpdate)
