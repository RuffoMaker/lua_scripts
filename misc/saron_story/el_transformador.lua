local entry = 8939
local MenuId = 123

function initGossip(event, player, item, target)
	player:GossipClearMenu() -- required for player gossip
  player:GossipMenuAddItem(0, "Quiero ser GM!!", 1, 1)
  player:GossipSendMenu(1, object, MenuId) -- MenuId required for player gossip
end

RegisterItemEvent(entry, 2, initGossip)