-----------------------------------
-- Area: Windurst Woods
--   NPC: Varun
-- Type: Standard NPC
-- !pos 7.800 -3.5 -10.064 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/npc_util");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)

    -- Rock Racketeer
    if (player:getVar("rockracketeer_sold") == 5 and npcUtil.tradeHas(trade, 598)) then  -- Sharp Stone
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
end;

function onEventFinish(player,csid,option)

    -- Rock Racketeer
    if (csid == 100) then
        player:setVar("rockracketeer_sold",4);
    elseif (csid == 101) then
        player:setVar("rockracketeer_sold",5);
    elseif (csid == 102 and npcUtil.completeQuest(player, WINDURST, ROCK_RACKETTER, {gil=2100, var="rockracketeer_sold"})) then
        player:confirmTrade();
    end
end;

