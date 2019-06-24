-----------------------------------
-- Area: Misareaux Coast
--  NPC: Dilapidated Gate
-- Entrance to Riverne Site #B01
-- !pos -259 -30 276 178
-----------------------------------
require("scripts/globals/missions");
local ID = require("scripts/zones/Misareaux_Coast/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.THE_SAVAGE and player:getVar("PromathiaStatus") == 0) then
        player:startEvent(8);
    elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.ANCIENT_VOWS and player:getVar("PromathiaStatus") == 0) then
        player:startEvent(6);
    elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.FLAMES_IN_THE_DARKNESS and player:getVar("PromathiaStatus") == 0) then
        player:startEvent(12);
    elseif (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.STORMS_OF_FATE) == QUEST_ACCEPTED and player:getVar('StormsOfFate') == 0) then
        player:startEvent(559);
    elseif (player:getCurrentMission(COP) > dsp.mission.id.cop.AN_ETERNAL_MELODY or player:hasCompletedMission(COP,dsp.mission.id.cop.THE_LAST_VERSE)) then
        player:startEvent(552);
    else
        player:messageSpecial(ID.text.DOOR_CLOSED);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 6 or csid == 12) then
        player:setVar("PromathiaStatus",1);
    elseif (csid == 559) then
        player:setVar('StormsOfFate',1);
    elseif (csid == 8 and option == 1) then
        player:setVar("PromathiaStatus",1);
        player:setPos(729,-20,410,88,29); -- Go to Riverne #B01
    end
end;