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

RegisterCreatureEvent(80500, 7, filcaun.OnUpdate)