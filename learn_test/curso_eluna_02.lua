local bolsa = 41599

local function primerLogin(event, player)
	player:SendBroadcastMessage('Hola!! Bienvenido a este servidor!! Esperamos que te guste tu estancia aquí.')
	player:AddItem( bolsa, 4 )
end


RegisterPlayerEvent( 30, function )