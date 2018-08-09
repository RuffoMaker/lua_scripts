local raskyPurgatorio = {
    entry = 90003,
    frases = {
        [0] = '¡¡Déjame entrar Rasky!!'
    },
    fase = 2,
    spells = {
        fireColumn = 76006
    },
    coordenadas = {
        puerta = {
            id = 100000,
            x = -1241.779663,
            y = 436.463135,
            z = 3.328583
        }
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
        creature:RegisterEvent(raskyPurgatorio.moverAPuerta, 5000, 1)
    end
end

function raskyPurgatorio.moverAPuerta(eventid, delay, repeats, creature)
    local coords = raskyPurgatorio.coordenadas.puerta
    creature:MoveTo( coords.id, coords.x, coords.y, coords.z )
    creature:RegisterEvent(raskyPurgatorio.castear, 3000, 1)
end

function raskyPurgatorio.castear(eventid, delay, repeats, creature)
    creature:CastSpell(creature, raskyPurgatorio.spells.fireColumn, true)
    creature:RegisterEvent(raskyPurgatorio.Hablar, 10000, 1)
end

function raskyPurgatorio.Hablar(eventid, delay, repeats, creature)
    creature:SendUnitSay('Ya podéis pasar.', 0)
end

RegisterCreatureGossipEvent(raskyPurgatorio.entry, 1, raskyPurgatorio.OnGossipHello)
RegisterCreatureGossipEvent(raskyPurgatorio.entry, 2, raskyPurgatorio.OnGossipSelect)