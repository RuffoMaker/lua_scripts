local filcaun = {
	sumatorioDetiempo = 0,
	contadorInicio = 1000		
}

function filcaun.OnUpdate(event, creature, diff)

filcaun.sumatorioDetiempo = filcaun.sumatorioDetiempo +diff

	if(filcaun.contadorInicio < filcaun.sumatorioDetiempo) then
		
			creature:SendUnitSay("Hola...", 0)
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