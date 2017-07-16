-----------------------------------
-- Area: Maze of Shakhrami
--  NPC: Rockwell
-- Quest: Your Crystal Ball
-- @pos -18 -13 181 198
-----------------------------------
package.loaded["scripts/zones/Maze_of_Shakhrami/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Maze_of_Shakhrami/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(JEUNO,YOUR_CRYSTAL_BALL) == QUEST_ACCEPTED and trade:hasItemQty(557,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then
        --no cs i think
        player:setVar("QuestYourCrystalBall_prog", 1);
        player:tradeComplete(trade);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getQuestStatus(JEUNO,YOUR_CRYSTAL_BALL) == QUEST_ACCEPTED and player:getVar("QuestYourCrystalBall_prog") == 1) then
        player:startEvent(52);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 52) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,556);
        else
            player:addItem(556);
            player:messageSpecial(ITEM_OBTAINED,556);
            player:setVar("QuestYourCrystalBall_prog", 0);
        end
    end
end;
