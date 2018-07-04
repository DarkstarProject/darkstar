-----------------------------------
-- Area: Windurst Woods
--  NPC: Boizo-Naizo
-- Involved in Quest: Riding on the Clouds
-- !pos -9.581 -3.75 -26.062 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
    if player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_4") == 6 and npcUtil.tradeHas(trade, 1127) then
        player:setVar("ridingOnTheClouds_4",0)
        player:confirmTrade()
        npcUtil.giveKeyItem(player, dsp.ki.SPIRITED_STONE)
    end
end

function onTrigger(player,npc)
    player:startEvent(275)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end