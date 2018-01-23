-----------------------------------
-- Area: La Theine Plateau
--  NPC: Chocobo Tracks
-- Involved in quest: Chocobo on the Loose!
-- !pos -556 0 523 102
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/La_Theine_Plateau/TextIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getQuestStatus(JEUNO,CHOCOBO_ON_THE_LOOSE) == QUEST_ACCEPTED and player:getVar("ChocoboOnTheLoose") < 2) then
        player:startEvent(209);
    else
        player:messageSpecial(CHOCOBO_TRACKS);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 209) then
        player:setVar("ChocoboOnTheLoose",2);
    end
end;