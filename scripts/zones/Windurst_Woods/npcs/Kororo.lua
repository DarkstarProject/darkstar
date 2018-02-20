-----------------------------------
-- Area: Windurst Woods
--  NPC: Kororo
-- Type: Standard NPC
-- !pos -11.883 -3.75 5.508 241
-- Starts quest: A Greeting Cardian
-- Involved in quests: Lost Chick
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local C2000 = player:getQuestStatus(WINDURST,THE_ALL_NEW_C_2000); --     previous quest in line
    local AGreetingCardian = player:getQuestStatus(WINDURST,A_GREETING_CARDIAN);
    local LPB = player:getQuestStatus(WINDURST,LEGENDARY_PLAN_B);
    local AGCcs = player:getVar("AGreetingCardian_Event");
    local AGCtime = player:getVar("AGreetingCardian_timer");

    -- A Greeting Cardian
    if (C2000 == QUEST_COMPLETED and AGreetingCardian == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 3) then
        player:startEvent(296); -- A Greeting Cardian quest start
    elseif (AGreetingCardian == QUEST_ACCEPTED and AGCcs == 3) then
        if (player:needToZone() or tonumber(os.date("%j")) == AGCtime) then
        player:startEvent(277); --standard dialog if JP midnight has not passed
        else
        player:startEvent(298); -- A Greeting Cardian part two
        end
    elseif (AGreetingCardian == QUEST_ACCEPTED and AGCcs == 5) then
        player:startEvent(303); -- A Greeting Cardian finish

    -- Might be Legendary Plan B, most likely Lost Chick related.
    -- only activates before LPB completes so leaving it in as is for now
    elseif (LPB == QUEST_ACCEPTED) then
        player:startEvent(312,0,529,940,858);

    else
        player:startEvent(277); --standard dialog
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    -- A Greeting Cardian
    if (csid == 296) then
        player:addQuest(WINDURST,A_GREETING_CARDIAN);
        player:setVar("AGreetingCardian_Event",2);
        player:setVar("AGreetingCardian_timer", os.date("%j"));
        player:needToZone(true); -- wait one day and zone after next step
    elseif (csid == 298) then
        player:setVar("AGreetingCardian_Event",4);
    elseif (csid == 303) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13330); -- Tourmaline Earring
        else
            player:addItem(13330);
            player:messageSpecial(ITEM_OBTAINED, 13330); -- Tourmaline Earring
            player:addFame(WINDURST,30);
            player:completeQuest(WINDURST,A_GREETING_CARDIAN);
            player:needToZone(true); -- zone before starting Legendary Plan B
            player:setVar("AGreetingCardian_timer",0);
            player:setVar("AGreetingCardian_Event",0); -- finish cleanup of A Greeting Cardian variables
        end
    end
end;
