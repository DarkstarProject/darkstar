-----------------------------------
-- Area: West Ronfaure
--  NPC: Aaveleon
-- Involved in Quest: A Sentry's Peril
-- !pos -431 -45 343 100
-----------------------------------
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
    if player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.A_SENTRY_S_PERIL) == QUEST_ACCEPTED then
        if npcUtil.tradeHas(trade, 600) then
            player:startEvent(100)
        else
            player:startEvent(118)
        end
    end
end

function onTrigger(player, npc)
    player:startEvent(101)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 100 and npcUtil.giveItem(player, 601) then
        player:confirmTrade()
    end
end
