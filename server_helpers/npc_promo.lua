local scriptName = 'npc_promo'

local charactersSQL = [[
	CREATE TABLE IF NOT EXISTS `promociones_entregadas` ( 
		`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT , 
		`promocion_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' , 
		`personaje_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' , 
		`cuenta_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' , 
		`ip` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0.0.0.0' , 
		`fecha` INT(10) UNSIGNED NOT NULL DEFAULT '0', 
		PRIMARY KEY (`id`)
	) ENGINE = InnoDB;
]]
CharDBQuery(charactersSQL)

local worldSQL = [[
	CREATE TABLE IF NOT EXISTS `promociones` ( 
		`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT , 
		`nombre` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' , 
		`unica_personaje` TINYINT(1) NOT NULL DEFAULT '0' , 
		`unica_cuenta` TINYINT(1) NOT NULL DEFAULT '0' , 
		`unica_ip` TINYINT(1) NOT NULL DEFAULT '0' , 
		`promo_padre` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
		PRIMARY KEY (`id`)
	) ENGINE = InnoDB;
]]
WorldDBQuery(worldSQL)

worldSQL = [[
	CREATE TABLE IF NOT EXISTS `promocion_requerimientos` ( 
		`promo_id` INT(20) UNSIGNED NOT NULL , 
		`clase` TINYINT(3) NOT NULL DEFAULT '0' , 
		`raza` TINYINT(3) NOT NULL DEFAULT '0' , 
		`nivel` TINYINT(3) NOT NULL DEFAULT '0' , 
		`nivel_gm` TINYINT(2) NOT NULL DEFAULT '0' , 
		`oro` INT(20) NOT NULL DEFAULT '0' , 
		`puntos_honor` INT(20) NOT NULL DEFAULT '0' , 
		`puntos_arena` INT(20) NOT NULL DEFAULT '0' , 
		`logro_1` INT(20) NOT NULL DEFAULT '0' , 
		`logro_2` INT(20) NOT NULL DEFAULT '0' , 
		`logro_3` INT(20) NOT NULL DEFAULT '0' , 
		PRIMARY KEY (`promo_id`)
	) ENGINE = InnoDB;
]]
WorldDBQuery(worldSQL)

worldSQL = [[
	CREATE TABLE IF NOT EXISTS `promocion_recompensas` ( 
		`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT , 
		`promocion_id` INT(10) UNSIGNED NOT NULL , 
		`tipo_recompensa` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'item' , 
		`valor` INT(20) NOT NULL DEFAULT '0' , 
		PRIMARY KEY (`id`), INDEX (`promocion_id`)
	) ENGINE = InnoDB;
]]
WorldDBQuery(worldSQL)

worldSQL = [[
	CREATE TABLE IF NOT EXISTS `npc_lua` ( 
		`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT , 
		`npc_entry` INT(10) UNSIGNED NOT NULL , 
		`lua_script` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
		PRIMARY KEY (`id`)
	) ENGINE = InnoDB;
]]
WorldDBQuery(worldSQL)


function OnGossipHello(event, player, creature)
	reset()
    player:GossipClearMenu() -- required for player gossip
    player:GossipMenuAddItem(0, "Promocion 1.", 1, 1)
    player:GossipMenuAddItem(0, "No quiero nada...", 1,0)
    player:GossipSendMenu(1, creature, MenuId) -- MenuId required for player gossip
end

function OnGossipSelect(event, player, creature, sender, intid, code, menuid)
  if (intid == 0) then
    player:GossipComplete()
  elseif (intid == 1) then
  	creature:SendUnitSay('Bien!', 0)
	end
end



local events = WorldDBQuery( "SELECT `npc_entry`, `lua_script` FROM `npc_lua` WHERE  UPPER(`lua_script`) =  UPPER('"..scriptName.."')" )
if (events) then
  repeat
    local npc_entry = events:GetUInt32(0)
    print(npc_entry)
		RegisterCreatureGossipEvent(npc_entry, 1, OnGossipHello)
		RegisterCreatureGossipEvent(npc_entry, 2, OnGossipSelect)
	until not events:NextRow()
end



