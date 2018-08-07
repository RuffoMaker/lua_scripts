local contador = 0
local contadorMax = 10000

function moveClose(event, creature, diff)
	contador = contador + diff
	creature.SendUnitSay('Hola!', 1)
	if(contador > contadorMax) then
		
		contador = 0
	end
end

RegisterCreatureEvent(6174, 7, moveClose)