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
  `account` int(11) unsigned NOT NULL,
  `transformacion` int(99) unsigned NOT NULL,
  PRIMARY KEY (`account`, `transformacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
]]
CharDBQuery(charactersSQL)

local charactersSQL = [[
	CREATE TABLE IF NOT EXISTS `character_transformacion` (
  `id` int(11) unsigned NOT NULL,
  `transformacion` int(11) unsigned NOT NULL,
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
			  local charactersSQL = "REPLACE INTO `character_transformacion` (`id`, `transformacion`) VALUES ('"..player:GetGUIDLow(player:GetGUID()).."', '"..transformaciones:GetUInt32(0).."');";
				CharDBQuery(charactersSQL)
				transformar(player)
			end
		until not transformaciones:NextRow()
	end
	
	if(intid == 0) then
		player:GossipComplete()
		player:DeMorph()
		player:SetSpeed(1, 1)
	end
end

function CheckTransformacionOnLogin(event, player)
	transformar(player)
end

function CheckTransformacion(event, player, newZone, newArea)
	transformar(player)
end

function transformar(player)
	transformaciones = CharDBQuery( "SELECT `transformacion`, `nombre`, `velocidad`, `spell` FROM `character_transformacion` INNER JOIN `transformaciones` ON (`character_transformacion`.`transformacion` = `transformaciones`.`id`) WHERE `id` = '"..player:GetGUIDLow(player:GetGUID()).."';" )
	if (transformaciones) then
		repeat
		  player:SetDisplayId(transformaciones:GetUInt32(0))
		  if(transformaciones:GetUInt32(2) ~= 0) then
		  	player:SetSpeed(1, transformaciones:GetUInt32(2))
		  end
		  if(transformaciones:GetUInt32(3) ~= 0) then
		  	player:LearnSpell(transformaciones:GetUInt32(3))
		  end
		until not transformaciones:NextRow()
	end
end

RegisterItemEvent(entry, 2, initGossip)
RegisterItemGossipEvent(entry, 2, OnGossipSelect)
RegisterPlayerEvent(3, CheckTransformacion)
RegisterPlayerEvent(27, CheckTransformacion)