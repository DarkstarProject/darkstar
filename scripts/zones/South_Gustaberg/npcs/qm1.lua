-----------------------------------
-- Area: South Gustaberg
--  NPC: qm1 (???)
-- Involved in Quest: The Cold Light of Day
-- !pos 744 0 -671 107
-----------------------------------
local ID = require("scripts/zones/South_Gustaberg/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if (npcUtil.tradeHas(trade, 4514) or npcUtil.tradeHas(trade, 5793)) and npcUtil.popFromQM(player, npc, ID.mob.BUBBLY_BERNIE, {hide = 0}) then
        player:confirmTrade()
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.MONSTER_TRACKS)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
