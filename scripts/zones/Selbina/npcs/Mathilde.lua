-----------------------------------
-- Area: Selbina
--  NPC: Mathilde
-- Involved in Quest: Riding on the Clouds
-- !pos 12.578 -8.287 -7.576 248
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
    if
        player:getQuestStatus(JEUNO, dsp.quest.id.jeuno.RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and
        player:getVar("ridingOnTheClouds_3") == 1 and
        npcUtil.tradeHas(trade, 1127)
    then
        player:setVar("ridingOnTheClouds_3", 0)
        npcUtil.giveKeyItem(player, dsp.ki.SOMBER_STONE)
        player:confirmTrade()
    end

end

function onTrigger(player,npc)
    if player:getCurrentMission(COP) == dsp.mission.id.cop.MORE_QUESTIONS_THAN_ANSWERS and player:getVar("PromathiaStatus") == 2 then
        player:startEvent(10005)
    else
        player:startEvent(171)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 10005 then
        player:setVar("PromathiaStatus", 0)
        player:completeMission(COP, dsp.mission.id.cop.MORE_QUESTIONS_THAN_ANSWERS)
        player:addMission(COP, dsp.mission.id.cop.ONE_TO_BE_FEARED)
    end
end