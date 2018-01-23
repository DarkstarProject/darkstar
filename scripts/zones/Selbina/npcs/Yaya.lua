-----------------------------------
-- Area: Selbina
--  NPC: Yaya
-- Starts Quest: Under the sea
-- !pos -19 -2 -16 248
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getFameLevel(SELBINA) >= 2 and player:getQuestStatus(OTHER_AREAS,UNDER_THE_SEA) == QUEST_AVAILABLE) then
        player:startEvent(31); -- Start quest "Under the sea"
    else
        player:startEvent(153); -- Standard dialog
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 31) then
        player:addQuest(OTHER_AREAS,UNDER_THE_SEA);
        player:setVar("underTheSeaVar",1);
    end
end;

