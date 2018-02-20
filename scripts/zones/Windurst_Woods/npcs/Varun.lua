-----------------------------------
-- Area: Windurst Woods
--   NPC: Varun
-- Type: Standard NPC
-- !pos 7.800 -3.5 -10.064 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)

    local RRvar = player:getVar("rockracketeer_sold");

    -- Rock Racketeer
    if (RRvar == 5 and trade:hasItemQty(598,1) == true and trade:getItemCount() == 1) then  -- Sharp Stone
        player:startEvent(102,2100); -- finish quest
    end
end;

function onTrigger(player,npc)

    local RRvar = player:getVar("rockracketeer_sold");
    local RockRacketeer = player:getQuestStatus(WINDURST,ROCK_RACKETTER);

    -- Rock Racketeer
    if (RockRacketeer == QUEST_ACCEPTED and RRvar == 3) then
        player:startEvent(100); -- talk about lost stone
    elseif (RockRacketeer == QUEST_ACCEPTED and RRvar == 4) then
        player:startEvent(101,0,598); -- send player to Palborough Mines

    -- standard dialog
    else
        player:startEvent(432);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    -- Rock Racketeer
    if (csid == 100) then
        player:setVar("rockracketeer_sold",4);
    elseif (csid == 101) then
        player:setVar("rockracketeer_sold",5);
    elseif (csid == 102) then
        player:tradeComplete();
        player:addFame(WINDURST,30);
        player:addGil(GIL_RATE*2100);
        player:completeQuest(WINDURST,ROCK_RACKETTER);
        player:setVar("rockracketeer_sold",0); -- finish cleanup of vars
    end
end;

