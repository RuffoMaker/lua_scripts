local EspirituVaca = {
	entry = 90012
};

function EspirituVaca.OnGossipHello(event, player, object)
    player:GossipClearMenu() -- required for player gossip
    player:GossipMenuAddItem(0, '¿Estoy muuuuuuuuuuerta?', 1, 1)
    player:GossipSendMenu(1, object, EspirituVaca.MenuId) -- MenuId required for player gossip
end

function EspirituVaca.OnGossipSelect(event, player, creature, sender, intid, code, menuid)
    if (intid == 1) then
        player:GossipComplete()     
        creature:SendUnitSay('¡Muuuuuuuu!', 0)
        creature:PlayDirectSound(1467)
    end
end

RegisterCreatureGossipEvent(EspirituVaca.entry, 1, EspirituVaca.OnGossipHello)
RegisterCreatureGossipEvent(EspirituVaca.entry, 2, EspirituVaca.OnGossipSelect)