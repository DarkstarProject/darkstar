-----------------------------------
-- Area: Port Bastok
--  NPC: Otto
-- Standard Info NPC
-- Involved in Quest: The Siren's Tear
-- @zone 236
-- !pos -145.929 -7.48 -13.701
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local SirensTear = player:getQuestStatus(BASTOK,THE_SIREN_S_TEAR);

    if (SirensTear == QUEST_ACCEPTED and player:getVar("SirensTear") == 0) then
        player:startEvent(5);
    else
        player:startEvent(20);
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