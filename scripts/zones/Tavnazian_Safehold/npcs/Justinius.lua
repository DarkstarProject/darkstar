-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Justinius
-- Involved in mission : COP2-3
-- !pos 76 -34 68 26
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) == dsp.mission.id.cop.DISTANT_BELIEFS and player:getVar("PromathiaStatus") == 3) then
        player:startEvent(113);
    elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.SHELTERING_DOUBT and player:getVar("PromathiaStatus") == 2) then
        player:startEvent(109);
    elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.THE_SAVAGE and player:getVar("PromathiaStatus") == 2) then
        player:startEvent(110);
    else
        player:startEvent(123);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 113) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,dsp.mission.id.cop.DISTANT_BELIEFS);
        player:addMission(COP,dsp.mission.id.cop.AN_ETERNAL_MELODY);
    elseif (csid == 109) then
        player:setVar("PromathiaStatus",3);
    elseif (csid == 110) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,dsp.mission.id.cop.THE_SAVAGE);
        player:addMission(COP,dsp.mission.id.cop.THE_SECRETS_OF_WORSHIP);
        player:addTitle(dsp.title.NAGMOLADAS_UNDERLING);
    end

end;