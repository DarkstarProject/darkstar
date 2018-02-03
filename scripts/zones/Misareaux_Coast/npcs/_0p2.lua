-----------------------------------
-- Area: Misareaux Coast
--  NPC: Dilapidated Gate
-- Entrance to Riverne Site #B01
-- !pos -259 -30 276 178
-----------------------------------
package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Misareaux_Coast/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == THE_SAVAGE and player:getVar("PromathiaStatus") == 0) then
        player:startEvent(8);
    elseif (player:getCurrentMission(COP) == ANCIENT_VOWS and player:getVar("PromathiaStatus") == 0) then
        player:startEvent(6);
    elseif (player:getCurrentMission(COP) == FLAMES_IN_THE_DARKNESS and player:getVar("PromathiaStatus") == 0) then
        player:startEvent(12);
    elseif (player:getQuestStatus(JEUNO,STORMS_OF_FATE) == QUEST_ACCEPTED and player:getVar('StormsOfFate') == 0) then
        player:startEvent(559);
    elseif (player:getCurrentMission(COP) > AN_ETERNAL_MELODY or player:hasCompletedMission(COP,THE_LAST_VERSE)) then
        player:startEvent(552);
    else
        player:messageSpecial(DOOR_CLOSED);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 6 or csid == 12) then
        player:setVar("PromathiaStatus",1);
    elseif (csid == 559) then
        player:setVar('StormsOfFate',1);
    elseif (csid == 8 and option == 1) then
        player:setVar("PromathiaStatus",1);
        player:setPos(729,-20,410,88,0x1D); -- Go to Riverne #B01
    end
end;