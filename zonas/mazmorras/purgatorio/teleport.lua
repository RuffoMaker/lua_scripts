local teleporterPurgatorio = {
    entry = 90002,
    frases = {
        [0] = '¡¡Quiero ir al Purgatorio!!'
    },
    MenuId = 123
};


function teleporterPurgatorio.OnGossipHello(event, player, object)
    player:GossipClearMenu() -- required for player gossip
    player:GossipMenuAddItem(0, teleporterPurgatorio.frases[0], 1, 1)
    player:GossipSendMenu(1, object, teleporterPurgatorio.MenuId) -- MenuId required for player gossip
end

function teleporterPurgatorio.OnGossipSelect(event, player, creature, sender, intid, code, menuid)
    if (intid == 1) then
        player:GossipComplete()
		player:SendBroadcastMessage('funciona')
	end
end

RegisterCreatureGossipEvent(teleporterPurgatorio.entry, 1, teleporterPurgatorio.OnGossipHello)
RegisterCreatureGossipEvent(teleporterPurgatorio.entry, 2, teleporterPurgatorio.OnGossipSelect)