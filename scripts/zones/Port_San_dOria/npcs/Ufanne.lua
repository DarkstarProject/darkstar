-----------------------------------
-- Area: Port San d'Oria
--   NPC: Ufanne
-- Type: Standard NPC
-- !pos -15.965 -3 -47.748 232
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_San_dOria/TextIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local fishCountVar = 0;
    if (player:getQuestStatus(SANDORIA,THE_RIVALRY) == QUEST_ACCEPTED) then
        fishCountVar = player:getVar("theCompetitionFishCountVar");
        player:startEvent(309,0,0,fishCountVar);
    elseif (player:getQuestStatus(SANDORIA,THE_COMPETITION) == QUEST_ACCEPTED) then
        fishCountVar = player:getVar("theCompetitionFishCountVar");
        player:startEvent(309,1,0,fishCountVar);
    else
        player:startEvent(310);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
