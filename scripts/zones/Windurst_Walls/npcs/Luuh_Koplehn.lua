-----------------------------------
-- Area: Windurst Walls
--  NPC: Luuh Koplehn
-- Standard Info NPC
-- !pos -93 -5 130 239
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local qStarStruck = player:getQuestStatus(WINDURST,STAR_STRUCK);

    if (qStarStruck == QUEST_ACCEPTED) then
        player:startEvent(200);
    else
        player:startEvent(322);
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
end;
