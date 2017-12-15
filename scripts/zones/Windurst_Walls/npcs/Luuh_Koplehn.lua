-----------------------------------
-- Area: Windurst Walls
--  NPC: Luuh Koplehn
-- Standard Info NPC
-- !pos -93 -5 130 239
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local qStarStruck = player:getQuestStatus(WINDURST,STAR_STRUCK);

    if (qStarStruck == QUEST_ACCEPTED) then
        player:startEvent(200);
    else
        player:startEvent(322);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
