--[[
	RuffoSchool <http://www.ruffoschool.com>	    
    Eluna Lua Engine <https://github.com/ElunaLuaEngine/Eluna>
    Eluna Scripts <https://github.com/ElunaLuaEngine/Scripts>
    Eluna Wiki <http://wiki.emudevs.com/doku.php?id=eluna>
	Date:20170807
	
	*== Script Info ==*
	* Zona: 
	* Descripcion:
	* Npc: <MJ> Rasky <90002>
]]--

	--Variables:
	local npcID = 90002
	local nombre = "Rasky!!!!"
	
	--         --
	
	local function OnGossipHello (event, player, object)
		Player = GetPlayerByName(nombre)
	end
	

	
RegisterCreatureGossipEvent(npcID, 1, OnGossipHello)