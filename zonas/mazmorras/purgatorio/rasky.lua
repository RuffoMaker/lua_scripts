local raskyPurgatorio = {
    entry = 90003,
    frases = {
        [0] = '¡¡Déjame entrar Rasky!!'
    },
    fase = 2,
    trigger = {},
    spells = {
        fireColumn = 76006
    }
};


function raskyPurgatorio.OnGossipHello(event, player, object)
    player:GossipClearMenu() -- required for player gossip
    player:GossipMenuAddItem(0, raskyPurgatorio.frases[0], 1, 1)
    player:GossipSendMenu(1, object, raskyPurgatorio.MenuId) -- MenuId required for player gossip
end

function raskyPurgatorio.OnGossipSelect(event, player, creature, sender, intid, code, menuid)
    if (intid == 1) then
        player:GossipComplete()
        creature:SendUnitSay('¡¡Estáis locos!! Quizás estéis a punto de morir... pero... ¡¡Teneis un par bien puestos!!', 0)
        raskyPurgatorio.trigger = creature:GetNearObject(10, 0, 80000)
        creature:CastSpell(raskyPurgatorio.trigger, raskyPurgatorio.spells.fireColumn, true)
    end
end

RegisterCreatureGossipEvent(raskyPurgatorio.entry, 1, raskyPurgatorio.OnGossipHello)
RegisterCreatureGossipEvent(raskyPurgatorio.entry, 2, raskyPurgatorio.OnGossipSelect)