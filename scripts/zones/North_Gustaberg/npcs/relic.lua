-----------------------------------
-- Area: North Gustaberg
--  NPC: <this space intentionally left blank>
-- !pos -217 97 461 106
-----------------------------------
local ID = require("scripts/zones/North_Gustaberg/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if player:getCharVar("RELIC_IN_PROGRESS") == 18305 and npcUtil.tradeHas(trade, {1451, 1577, 1589, 18305}) then -- currency, shard, necropsyche, stage 4
        player:startEvent(254, 18306)
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 254 and npcUtil.giveItem(player, {18306, {1450, 30}}) then
        player:confirmTrade()
        player:setCharVar("RELIC_IN_PROGRESS", 0)
    end
end
