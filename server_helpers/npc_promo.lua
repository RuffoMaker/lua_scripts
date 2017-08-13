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
		`nombre` VARCHAR(999) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' , 
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
    
    local contador = 1
    local promociones = WorldDBQuery( "SELECT `nombre`, `unica_personaje`, `unica_cuenta`, `unica_ip` FROM `promociones`;" )
		if (promociones) then
		  repeat
		  	local nombre = promociones:GetString(0)
		  	local unica_personaje = promociones:GetUInt32(1)
		  	local unica_cuenta = promociones:GetUInt32(2)
		  	local unica_ip = promociones:GetUInt32(3)

		  	player:GossipMenuAddItem(0, nombre, 1, contador)
		  	contador = contador + 1

		  until not promociones:NextRow()
		end


    player:GossipMenuAddItem(0, "No quiero nada...", 1,0)
    player:GossipSendMenu(1, creature, MenuId) -- MenuId required for player gossip
end

function OnGossipSelect(event, player, creature, sender, intid, code, menuid)
  if (intid == 0) then
    player:GossipComplete()
	end

	local contador = 1
    local promociones = WorldDBQuery( "SELECT `id`, `nombre`, `unica_personaje`, `unica_cuenta`, `unica_ip` FROM `promociones`;" )
		if (promociones) then
		  repeat
		  	local id = promociones:GetUInt32(0)
		  	local nombre = promociones:GetString(1)
		  	local unica_personaje = promociones:GetUInt32(2)
		  	local unica_cuenta = promociones:GetUInt32(3)
		  	local unica_ip = promociones:GetUInt32(4)

		  	if (intid == contador) then
		  		local recompensas = WorldDBQuery( "SELECT `tipo_recompensa`, `valor` FROM `promocion_recompensas` WHERE `promocion_id` = '"..id.."';" )
					if (recompensas) then
					  repeat
					  	local tipo_recompensa = promociones:GetString(0)
		  				local valor = promociones:GetUInt32(1)

		  				if(tipo_recompensa == 'item') then
		  					player:AddItem(valor)
		  				end

		  				if(tipo_recompensa == 'oro') then
		  					player:ModifyMoney(valor)
		  				end

		  				if(tipo_recompensa == 'honor') then
		  					player:ModifyHonorPoints(valor)
		  				end

		  				if(tipo_recompensa == 'arena') then
		  					player:ModifyArenaPoints(valor)
		  				end

		  				if(tipo_recompensa == 'titulo') then
		  					player:SetKnownTitle(valor)
		  				end

		  				if(tipo_recompensa == 'nivel') then
		  					player:SetLevel(valor)
		  				end

		  				local player_guid = player:GetGUID()
		  				local player_account_id = player:GetAccountId()
		  				local player_ip = player:GetPlayerIP()
		  				local timestamp = os.time()

		  				CharDBQuery( "INSERT INTO `promociones_entregadas` (`promocion_id`, `personaje_id`, `cuenta_id`, `ip`, `fecha`) VALUES ('"..id.."', '"..player_guid.."', '"..player_account_id.."', '"..player_ip.."', '"..timestamp.."')" )
		  				

					  until not recompensas:NextRow()
					end
			    player:GossipComplete()
				end

		  	contador = contador + 1

		  until not promociones:NextRow()
		end

end



local events = WorldDBQuery( "SELECT `npc_entry`, `lua_script` FROM `npc_lua` WHERE  UPPER(`lua_script`) =  UPPER('"..scriptName.."')" )
if (events) then
  repeat
    local npc_entry = events:GetUInt32(0)
		RegisterCreatureGossipEvent(npc_entry, 1, OnGossipHello)
		RegisterCreatureGossipEvent(npc_entry, 2, OnGossipSelect)
	until not events:NextRow()
end



