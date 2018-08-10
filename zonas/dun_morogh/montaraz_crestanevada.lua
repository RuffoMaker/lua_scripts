local montaraz = {
	entry1 = 853,
	entry2 = 727,
	tiempoFraseInit = 200000,
	tiempoFrase = 10000,
	fraseadecir = -1,
	frasedicha = -1,
	frases = {
		[0] = 'Que puto frio...',
		[1] = ' Ya tengo las botas llenas de nieve otra vez..., maldito clima...'
	}
}
function montaraz.npcescogido()
	local n = math.random(0, 1)

	if(n == 0)then
		return montaraz.entry1
	else
		return montaraz.entry2
	end


end

function montaraz.OnUpdate(event, creature, diff)	
montaraz.tiempoFrase = montaraz.tiempoFrase - diff

	if(montaraz.tiempoFrase < 0) then		
		montaraz.fraseadecir = math.random(0, 1)
		if(montaraz.fraseadecir ~= montaraz.frasedicha) then
			creature:SendUnitSay(montaraz.frases[montaraz.fraseadecir], 0)
			montaraz.frasedicha = montaraz.fraseadecir
			montaraz.Reset(creature)
		end
	end
end


function montaraz.Reset(creature)
	montaraz.tiempoFrase = montaraz.tiempoFraseInit
end

RegisterCreatureEvent(montaraz.npcescogido(), 7, montaraz.OnUpdate)