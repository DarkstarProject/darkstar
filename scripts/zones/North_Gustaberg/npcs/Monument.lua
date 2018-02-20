-----------------------------------
-- Area: North Gustaberg
--  NPC: Monument
-- Involved in Quest "Hearts of Mythril"
-- !pos 300.000 -62.803 498.200 106
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/North_Gustaberg/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local Hearts = player:getQuestStatus(BASTOK,HEARTS_OF_MYTHRIL);

    if (Hearts == QUEST_ACCEPTED and player:hasKeyItem(BOUQUETS_FOR_THE_PIONEERS)) then
        player:startEvent(11);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 11 and option == 0) then
        player:setVar("HeartsOfMythril",1);
        player:delKeyItem(BOUQUETS_FOR_THE_PIONEERS);
    end

end;


