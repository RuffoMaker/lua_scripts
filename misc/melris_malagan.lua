local contador = 0
local contadorMax = 10000

function moveClose(event, creature, diff)
	contador = contador + diff
	if(contador > contadorMax) then
		creature.SendUnitSay('Hola!', 1)
		contador = 0
	end
end

RegisterCreatureEvent(12480, 7, moveClose)