-----------------------------------
-- Area: Bastok Markets
--  NPC: Zacc
-- Type: Quest NPC
-- !pos -255.709 -13 -91.379 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(BASTOK, WISH_UPON_A_STAR) == QUEST_COMPLETED) then -- Quest: Wish Upon a Star - Quest has been completed.
        player:startEvent(336);
    elseif (player:getFameLevel(BASTOK) > 4 and player:getQuestStatus(BASTOK, WISH_UPON_A_STAR) == QUEST_AVAILABLE) then -- Quest: Wish Upon a Star - Start quest.
        player:startEvent(329);
    else -- Standard dialog
        player:startEvent(328);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 329) then -- Quest: Wish Upon a Star
        player:addQuest(BASTOK, WISH_UPON_A_STAR);
        player:setVar("WishUponAStar_Status", 1);
    end
end;
