local entry = 8939
local MenuId = 123

local charactersSQL = [[
	CREATE TABLE IF NOT EXISTS `transformaciones` (
  `id` int(11) unsigned NOT NULL,
  `nombre` varchar(999) NOT NULL DEFAULT '',
  `velocidad` int(11) unsigned NOT NULL,
  `spell` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
]]
CharDBQuery(charactersSQL)

local charactersSQL = [[
	CREATE TABLE IF NOT EXISTS `account_transformaciones` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account` int(11) unsigned NOT NULL,
  `transformacion` int(99) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
]]
CharDBQuery(charactersSQL)

function initGossip(event, player, item, target)
	player:GossipClearMenu() -- required for player gossip

	transformaciones = CharDBQuery( "SELECT `transformacion`, `nombre`, `velocidad`, `spell` FROM `account_transformaciones` INNER JOIN `transformaciones` ON (`account_transformaciones`.`transformacion` = `transformaciones`.`id`) WHERE `account` = '"..player:GetAccountId().."' ORDER BY `nombre` DESC;" )
	if (transformaciones) then
		repeat
			player:GossipMenuAddItem(0, transformaciones:GetString(1), 1, transformaciones:GetUInt32(0))
		until not transformaciones:NextRow()
	end

  player:GossipMenuAddItem(0, "Quiero volver a mi apariencia original.", 1, 0)
  player:GossipSendMenu(1, item, MenuId) -- MenuId required for player gossip
end

local function OnGossipSelect(event, player, item, sender, intid, code, menuid)
	transformaciones = CharDBQuery( "SELECT `transformacion`, `nombre`, `velocidad`, `spell` FROM `account_transformaciones` INNER JOIN `transformaciones` ON (`account_transformaciones`.`transformacion` = `transformaciones`.`id`) WHERE `account` = '"..player:GetAccountId().."' ORDER BY `nombre` DESC;" )
	if (transformaciones) then
		repeat
			if(intid == transformaciones:GetUInt32(0)) then
			  player:GossipComplete()
			  player:SetDisplayId(transformaciones:GetUInt32(0))
			  if(transformaciones:GetUInt32(2) ~= 0) then
			  	player:SetSpeed(1, transformaciones:GetUInt32(2))
			  end
			  if(transformaciones:GetUInt32(3) ~= 0) then
			  	player:LearnSpell(transformaciones:GetUInt32(3))
			  end
			end
		until not transformaciones:NextRow()
	end
	
	if(intid == 0) then
		player:GossipComplete()
		player:DeMorph()
		player:SetSpeed(1, 1)
	end
end

RegisterItemEvent(entry, 2, initGossip)
RegisterItemGossipEvent(entry, 2, OnGossipSelect)