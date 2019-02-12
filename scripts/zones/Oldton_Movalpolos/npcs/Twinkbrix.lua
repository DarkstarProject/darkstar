-----------------------------------
-- Area: Oldton Movalpolos
--  NPC: Twinkbrix
-- Type: Warp NPC
-- !pos -292.779 6.999 -263.153 11
-----------------------------------
local ID = require("scripts/zones/Oldton_Movalpolos/IDs")
require("scripts/globals/teleports")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    local mineShaftWarpCost = 2000
    local tradeGil = trade:getGil()

    if player:hasKeyItem(dsp.ki.SHAFT_GATE_OPERATING_DIAL) and npcUtil.tradeHas(trade, {{"gil", mineShaftWarpCost}}) then
        player:startEvent(56)
    elseif not player:hasKeyItem(dsp.ki.SHAFT_GATE_OPERATING_DIAL) and tradeGil > 0 and tradeGil <= 10000 and npcUtil.tradeHas(trade, {{"gil", tradeGil}}) then
        local maxRoll = tradeGil / 200
        local diceRoll = math.random(2, 100)
        player:startEvent(55, tradeGil, maxRoll, diceRoll, mineShaftWarpCost)
    end
end

function onTrigger(player, npc)
    if player:hasKeyItem(dsp.ki.SHAFT_GATE_OPERATING_DIAL) then
        player:startEvent(50)
    else
        player:startEvent(52)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 55 and option == 1 then
        npcUtil.giveKeyItem(player, dsp.ki.SHAFT_GATE_OPERATING_DIAL)
        player:confirmTrade()
    elseif csid == 55 and option == 0 then
        player:confirmTrade()
    elseif csid == 56 and option == 1 then
        player:confirmTrade()
        dsp.teleport.to(player, dsp.teleport.id.MINESHAFT)
    end
end