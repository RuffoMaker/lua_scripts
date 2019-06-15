local AIO = AIO or require("AIO")

local charactersSQL = [[
	CREATE TABLE IF NOT EXISTS `puntos_alma` (
  `guid` int(11) unsigned NOT NULL,
  `restantes` int(11) NOT NULL DEFAULT 0,
  `fuerza` int(11) NOT NULL DEFAULT 0,
  `agilidad` int(11) NOT NULL DEFAULT 0,
  `aguante` int(11) NOT NULL DEFAULT 0,
  `intelecto` int(11) NOT NULL DEFAULT 0,
  `espiritu` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
]]
CharDBQuery(charactersSQL)

local MyHandlers = AIO.AddHandlers("Kaev", {})
local AttributesPointsLeft = {}
local AttributesPointsSpend = {}
local AttributesAuraIds = { 7464, 7471, 7477, 7468, 7474 } -- Strength, Agility, Stamina, Intellect, Spirit

local function AddPlayerStats(msg, player)
    local guid = player:GetGUIDLow()
    local spend, left = AttributesPointsSpend[guid], AttributesPointsLeft[guid]
    return msg:Add("Kaev", "SetStats", left, AIO.unpack(spend))
end
AIO.AddOnInit(AddPlayerStats)

local function UpdatePlayerStats(player)
	local guid = player:GetGUIDLow()
	CharDBQuery( "UPDATE `puntos_alma` SET `restantes` = '"..AttributesPointsLeft[guid].."', `fuerza` = '"..AttributesPointsSpend[guid][1].."', `agilidad` = '"..AttributesPointsSpend[guid][2].."', `aguante` = '"..AttributesPointsSpend[guid][3].."', `intelecto` = '"..AttributesPointsSpend[guid][4].."', `espiritu` = '"..AttributesPointsSpend[guid][5].."' WHERE `guid` = '"..guid.."';" )
    
    for k, v in pairs(AttributesPointsSpend[guid]) do
        local contador = 1

        while contador <= v do
            local aura = player:GetAura(AttributesAuraIds[k])
            if (aura) then
                aura:SetStackAmount(v)
            else
                player:AddAura(AttributesAuraIds[k], player)
            end
            contador = contador + 1
        end
    end
        
    AddPlayerStats(AIO.Msg(), player):Send(player)
end

local function AttributesInitPoints(guid)
	puntosAlma = CharDBQuery( "SELECT `restantes`, `fuerza`, `agilidad`, `aguante`, `intelecto`, `espiritu` FROM `puntos_alma` WHERE `guid` = '"..guid.."';" )
    if (puntosAlma) then
		repeat
			AttributesPointsLeft[guid] = puntosAlma:GetUInt32(0)
    		AttributesPointsSpend[guid] = { puntosAlma:GetUInt32(1), puntosAlma:GetUInt32(2), puntosAlma:GetUInt32(3), puntosAlma:GetUInt32(4), puntosAlma:GetUInt32(5) }
		until not puntosAlma:NextRow()
	else
		CharDBQuery( "INSERT INTO `puntos_alma` (`guid`, `restantes`, `fuerza`, `agilidad`, `aguante`, `intelecto`, `espiritu`) VALUES ('"..guid.."', '5', '0', '0', '0', '0', '0');" )
		AttributesPointsLeft[guid] = 5
		AttributesPointsSpend[guid] = { 0, 0, 0, 0, 0 }
	end


end
local function AttributesDeinitPoints(guid)
    AttributesPointsLeft[guid] = nil
    AttributesPointsSpend[guid] = nil
end

local function OnLogin(event, player)
    AttributesInitPoints(player:GetGUIDLow())
    UpdatePlayerStats(player)
    AIO.Handle(player, "Kaev", "ShowAttributes")
end
local function OnLogout(event, player)
    AttributesDeinitPoints(player:GetGUIDLow())
end

RegisterPlayerEvent(3, OnLogin)
RegisterPlayerEvent(4, OnLogout)
for k,v in ipairs(GetPlayersInWorld()) do
    OnLogin(3, v)
end

function MyHandlers.AddPoints(player)
    if (player:IsInCombat()) then
        player:SendBroadcastMessage("No puedes comprar puntos de alma mientras estás en combate.")
    else
        local guid = player:GetGUIDLow()

        if (player:GetHonorPoints() < 200) then
            player:SendBroadcastMessage("No tienes suficientes puntos de honor.")
        else
            player:ModifyHonorPoints(-200)
            AttributesPointsLeft[guid] = AttributesPointsLeft[guid] + 1
            player:SendBroadcastMessage("Has comprado un punto de alma.")
            UpdatePlayerStats(player)
        end
    end
end

function MyHandlers.ResetPoints(player)
    if (player:IsInCombat()) then
        player:SendBroadcastMessage("No puedes reiniciar los puntos de alma mientras estás en combate.")
    else
        local guid = player:GetGUIDLow()

        if (player:GetHonorPoints() < 1000) then
            player:SendBroadcastMessage("No tienes suficientes puntos de honor.")
        else
            player:ModifyHonorPoints(-1000)
            local suma = AttributesPointsLeft[guid]
            suma = suma + AttributesPointsSpend[guid][1]
            suma = suma + AttributesPointsSpend[guid][2]
            suma = suma + AttributesPointsSpend[guid][3]
            suma = suma + AttributesPointsSpend[guid][4]
            suma = suma + AttributesPointsSpend[guid][5]
            AttributesPointsLeft[guid] = suma
            AttributesPointsSpend[guid][1] = 0
            AttributesPointsSpend[guid][2] = 0
            AttributesPointsSpend[guid][3] = 0
            AttributesPointsSpend[guid][4] = 0
            AttributesPointsSpend[guid][5] = 0
            player:SendBroadcastMessage("Has reiniciado tus puntos de alma.")
            UpdatePlayerStats(player)
        end
    end
end

function MyHandlers.AttributesIncrease(player, statId)
    if (player:IsInCombat()) then
        player:SendBroadcastMessage("No puedes asignar los puntos de alma mientras estás en combate.")
    else
        local guid = player:GetGUIDLow()
        local spend, left = AttributesPointsSpend[guid], AttributesPointsLeft[guid]
        if not spend or not left then
            return
        end
        if not statId or not spend[statId] then
            return
        end
        if (left <= 0) then
            player:SendBroadcastMessage("No tienes puntos de alma disponibles.")
        else
            AttributesPointsLeft[guid] = left - 1
            spend[statId] = spend[statId] + 1
            
            local aura = player:GetAura(AttributesAuraIds[statId])
            if (aura) then
                aura:SetStackAmount(spend[statId])
            else
                player:AddAura(AttributesAuraIds[statId], player)
            end
            UpdatePlayerStats(player)
        end
    end
end

function MyHandlers.AttributesDecrease(player, statId)
    if (player:IsInCombat()) then
        player:SendBroadcastMessage("No puedes asignar los puntos de alma mientras estás en combate.")
    else
        local guid = player:GetGUIDLow()
        local spend, left = AttributesPointsSpend[guid], AttributesPointsLeft[guid]
        if not spend or not left then
            return
        end
        if not statId or not spend[statId] then
            return
        end
        if (spend[statId] <= 0) then
            player:SendBroadcastMessage("No hay puntos de alma distribuidos en este atributo.")
        else
            AttributesPointsLeft[guid] = left + 1
            spend[statId] = spend[statId] - 1
            local aura = player:GetAura(AttributesAuraIds[statId])
            if (aura) then
                aura:SetStackAmount(spend[statId])
            else
                player:AddAura(AttributesAuraIds[statId], player)
            end
            UpdatePlayerStats(player)
        end
    end
end

local function AttributesOnCommand(event, player, command)
	if(command == "alma") then
    	AIO.Handle(player, "Kaev", "ShowAttributes")
    	return false
    end
end
RegisterPlayerEvent(42, AttributesOnCommand)