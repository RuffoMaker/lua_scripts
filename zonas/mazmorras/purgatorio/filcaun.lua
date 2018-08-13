local filcaun = {
	sumatorioDetiempo = 0,
	contadorInicio = 1000,
	contadorInicioDicho = 0,
	emoteHablar = 1,
	idemot = 0,
	emoteNoHaceNada = 0			
}

function filcaun.OnUpdate(event, creature, diff)

filcaun.sumatorioDetiempo = filcaun.sumatorioDetiempo +diff

	if(filcaun.contadorInicio < filcaun.sumatorioDetiempo) then
		if(creature:GetFriendlyUnitsInRange(3) ~= {}) then
			creature:Emote(filcaun.emoteHablar)
			creature:SendUnitSay(" ¡Pssss!,¡Pssss!,¡Pssss! ¡por aquí!", 0)
			creature:SendUnitSay(" No hagaís ruido.Escape por los pelos... ese esbirro de Torcuato... ¡esta incluso más loco que él¡", 0)	
			creature:SendUnitSay(" Escape graciás aún búfo que conseguir lanzarme que invente yo mismo.., es un poco impreciso aún y los resultados pueden variar..Pero si quereís os lo  lanzare a ustedes también, solo tiene que hablar conmigo todo el que quiera probar..,¡No seais tímidos!.", 0)
			creature:SendUnitSay(" Como os dije aun esta en fase experimental... pero puede funcionar muy bien...", 0)
			creature:Emote(filcaun.emoteNoHaceNada)
			-- filcaun.contadorInicioDicho = filcaun.contadorInicioDicho + 1
		end
		filcaun.sumatorioDetiempo = 0
	else
		creature:SendUnitSay("En espera...", 0)
	end 
end

 function filcaun.OnReceiveEmote(event, creature, player, emoteid)
 		filcaun.idemot = emoteid
		creature:SendUnitSay(filcaun.idemot,0)
	  
end

RegisterCreatureEvent(80500, 8, filcaun.OnReceiveEmote)
RegisterCreatureEvent(80500, 7, filcaun.OnUpdate)