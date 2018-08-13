local filcaun = {
	contadorInicioDicho = 0,
	emoteHablar = 1,
	emoteNoHaceNada = 0			
}

function filcaun.OnUpdate(event, creature, diff)

	if(filcaun.contadorInicioDicho == 0) then
		creature:Emote(filcaun.emoteHablar)
		creature:SendUnitSay(" ¡Pssss!,¡Pssss!,¡Pssss! ¡por aquí!", 0)
		creature:SendUnitSay(" No hagaís ruido.Escape por los pelos... ese esbirro de Torcuato... ¡esta incluso más loco que él¡", 0)	
		creature:SendUnitSay(" Escape graciás aún búfo que conseguir lanzarme que invente yo mismo.., es un poco impreciso aún y los resultados pueden variar..Pero si quereís os lo  lanzare a ustedes también, solo tiene que hablar conmigo todo el que quiera probar..,¡No seais tímidos!.", 0)
		creature:SendUnitSay(" Como os dije aun esta en fase experimental... pero puede funcionar muy bien...", 0)
		creature:Emote(filcaun.emoteNoHaceNada)
		filcaun.contadorInicioDicho = filcaun.contadorInicioDicho + 1
	end
	
  
end




 function filcaun.OnReceiveEmote(event, creature, player, emoteid)
 	local recibe_hola = 101
	local recibe_hola2 = 55
	local recibe_saludo = 78
	local envia_saludo = 66	

	if(emoteid == recibe_hola or emoteid == recibe_hola2) then
		creature:SendUnitSay("Hola cosita linda...",0)
	elseif(emoteid == recibe_saludo) then
		creature:Emote(envia_saludo)
		creature:SendUnitSay("¡"..player:GetName().." alistaté en la marina!.", 0) -- saludo al objetivo
	else
		creature:SendUnitSay('Y tu que miras... camina!', 0)
	end
	  
end


RegisterCreatureEvent(80500, 8, filcaun.OnReceiveEmote)

RegisterCreatureEvent(80500, 7, filcaun.OnUpdate)