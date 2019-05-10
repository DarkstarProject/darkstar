-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: _0q1 (Sewer Entrance)
-- !pos 28 -12 44 26
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.THE_LOST_CITY and player:getVar("PromathiaStatus") > 0) then
        player:startEvent(103);
    elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.CHAINS_AND_BONDS and player:getVar("PromathiaStatus") == 3) then
        player:startEvent(116);
    elseif (player:getCurrentMission(COP) >= dsp.mission.id.cop.DISTANT_BELIEFS or player:hasCompletedMission(COP,dsp.mission.id.cop.THE_LAST_VERSE)) then
        player:startEvent(502);
    else
        -- player:messageSpecial();
    end

    return 1;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 103) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,dsp.mission.id.cop.THE_LOST_CITY);
        player:addMission(COP,dsp.mission.id.cop.DISTANT_BELIEFS);
    elseif (csid == 116) then
        player:setVar("PromathiaStatus",4);
    elseif (csid == 502 and option == 1) then
        player:setPos(260.068,0,-283.568,190,27); -- To Phomiuna Aqueducts {R}
    end
end;
