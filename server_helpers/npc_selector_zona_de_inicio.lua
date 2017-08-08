local NPCID = 60000
local maximo_nivel = 10

local zones = {
  [0] = { -- Alianza
    [1] = {"Humanos", 0, -8949.950195, -132.492996, 83.531197, 0},
    [2] = {"Elfos de la Noche", 1, 10311.299805, 832.463013, 1326.407837, 5.696320},
    [3] = {"Enanos", 0, -6240.319824, 331.032990, 382.757996, 6.177160},
    [4] = {"Gnomos", 0, -6240.319824, 331.032990, 382.757996, 6.177160},
    [5] = {"Draeneis", 530, -3961.639893, -13931.200195, 100.613525, 2.083640},
  },

  [1] = { -- Horda
    [6] = {"Orcos", 1, -618.518005, -4251.669922, 38.717999, 0},
    [7] = {"Troll", 1, -618.518005, -4251.669922, 38.717999, 0},
    [8] = {"No-Muertos", 0, 1676.709961, 1678.310059, 121.669998, 3.163933},
    [9] = {"Tauren", 1, -2917.580078, -257.980011, 52.996799, 0},
    [10] = {"Elfos de Sangre", 530, 10349.599609, -6357.290039, 33.402599, 5.316050},
  }
}

function On_Gossip(event, player, unit)
  if player:GetLevel() <= maximo_nivel then
    player:GossipMenuAddItem(0, "Escoge una zona de inicio.", 0, 11)
    local playerTeam = player:GetTeam()
    local options = zones[playerTeam]

    for k, v in pairs(options) do 
      player:GossipMenuAddItem(4, v[1], 0, k)
    end
  else
    player:GossipMenuAddItem(0, "Tu nivel es muy alto.", 0, 0)
  end

  player:GossipSendMenu(1, unit)
end

function On_Select(event, player, unit, sender, intid, code)
  if intid >= 1 and intid <= 10 then
    local options = zones[player:GetTeam()]
    local coords = options[intid]
    player:Teleport(coords[2], coords[3], coords[4], coords[5], coords[6])
  end

  player:GossipComplete()
end

RegisterCreatureGossipEvent(NPCID, 1, On_Gossip)
RegisterCreatureGossipEvent(NPCID, 2, On_Select)