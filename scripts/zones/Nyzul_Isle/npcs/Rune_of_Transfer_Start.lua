-----------------------------------
-- Area:  Nyzul_Isle
-- NPC:   Rune of Transfer
-- Notes: Allows players to select a floor to transport to
-- !pos -20.000 -4.000 -11.000
-----------------------------------
local ID = require("scripts/zones/Nyzul_Isle/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/zones/Nyzul_Isle/globals")
require("scripts/zones/Nyzul_Isle/instances/Nyzul_Isle_Investigation")
-----------------------------------
-- Max floors 16777212, 0xFFFFFC <0 4 12 28 60 124 252 508 1020 2044 4092 8188 16380 32764 65532 131068 262140 524284 1048572 2097148 4194300 8388604 16777212
function onTrigger(player, npc)
    local floorsAvailable = 4294967292
    local tokens = player:getCurrency("nyzul_isle_assault_point")
    local prefered = 0 -- set prefered items at Sorrowfull_sage
	local floorProgress = floorsAvailable - player:getVar("NyzulFloorProgress")

    if not player:hasKeyItem(dsp.keyItem.RUNIC_DISC) then
        player:messageSpecial(ID.text.NEW_USER, dsp.keyItem.RUNIC_DISC)
        npcUtil.giveKeyItem(player, dsp.keyItem.RUNIC_DISC)
    else
        player:startEvent(94, dsp.keyItem.RUNIC_DISC, tokens, 1, prefered, 100, 200, 300, floorProgress)
	end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player,csid,option)
local instance = player:getInstance()
local chars = instance:getChars()
local npc = instance:getEntity(bit.band(ID.npc.RUNE_TRANSFER_START, 0xFFF), dsp.objType.NPC)

    if csid == 94 then
        local floorCost = nyzul.floorCost[option]
        if player:getCurrency("nyzul_isle_assault_point") >= floorCost.cost then
            player:delCurrency("nyzul_isle_assault_point", floorCost.cost)
            npc:setLocalVar("Nyzul_Isle_StartingFloor", floorCost.level)
            npc:setLocalVar("Nyzul_Isle_Leader", player:getID())
            npc:setLocalVar("Nyzul_Isle_FloorLayout", math.random(1,16))
            npc:setLocalVar("Nyzul_Current_Floor", floorCost.level)
            pickSetPoint(player)
            for i,v in pairs(chars) do
                v:startEvent(95)
            end
        else 
            player:messageSpecial(ID.text.INSUFFICIENT_TOKENS)
        end
    end
end