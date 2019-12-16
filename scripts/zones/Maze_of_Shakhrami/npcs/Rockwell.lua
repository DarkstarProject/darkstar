-----------------------------------
-- Area: Maze of Shakhrami
--  NPC: Rockwell
-- Quest: Your Crystal Ball
-- !pos -18 -13 181 198
-----------------------------------
local ID = require("scripts/zones/Maze_of_Shakhrami/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
    if player:getQuestStatus(JEUNO, dsp.quest.id.jeuno.YOUR_CRYSTAL_BALL) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 557) then
        player:setCharVar("QuestYourCrystalBall_prog", 1)
        player:confirmTrade(trade)
    end
end

function onTrigger(player, npc)
    if player:getQuestStatus(JEUNO, dsp.quest.id.jeuno.YOUR_CRYSTAL_BALL) == QUEST_ACCEPTED and player:getCharVar("QuestYourCrystalBall_prog") == 1 then
        player:startEvent(52)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 52 and npcUtil.giveItem(player, 556) then
        player:setCharVar("QuestYourCrystalBall_prog", 0)
    end
end
