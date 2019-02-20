-----------------------------------
-- Area: Lower Delkfutt's Tower
--  NPC: Cermet Door
-- Notes: Door opens when you trade Delkfutt Key to it
-- !pos 345 0.1 20 184
-----------------------------------
local ID = require("scripts/zones/Lower_Delkfutts_Tower/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if npcUtil.tradeHas(trade, 549) then -- Delkfutt Key
        player:startEvent(16)
    end
end

function onTrigger(player, npc)
    if player:hasKeyItem(dsp.ki.DELKFUTT_KEY) then
        player:startEvent(16)
    else
        player:startEvent(10) -- door is firmly shut
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option, npc)
    if csid == 16 and option == 1 then
        if not player:hasKeyItem(dsp.ki.DELKFUTT_KEY) then
            npcUtil.giveKeyItem(player, dsp.ki.DELKFUTT_KEY)
            player:confirmTrade()
        end
    end
end
