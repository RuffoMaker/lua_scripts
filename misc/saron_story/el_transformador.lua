local entry = 8939
local MenuId = 123

function initGossip(event, player, item, target)
	player:GossipClearMenu() -- required for player gossip
  player:GossipMenuAddItem(0, "Vaca Lechera", 1, 1)
  player:GossipMenuAddItem(0, "Quiero volver a mi apariencia original.", 1, 2)
  player:GossipSendMenu(1, item, MenuId) -- MenuId required for player gossip
end

local function OnGossipSelect(event, player, item, sender, intid, code, menuid)
  if(intid == 1) then
	  player:GossipComplete()
	  player:SetDisplayId(1060)
	elseif(intid == 2) then
		player:GossipComplete()
		player:DeMorph()
	end
end

RegisterItemEvent(entry, 2, initGossip)
RegisterItemGossipEvent(entry, 2, OnGossipSelect)