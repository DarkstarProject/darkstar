-----------------------------------
-- Area: Davoi
--  NPC: Zantaviat
-- Involved in Mission: The Davoi Report
-- !pos 215 0.1 -10 149
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Davoi/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local CurrentMission = player:getCurrentMission(SANDORIA);
    local infiltrateDavoi = player:hasCompletedMission(SANDORIA,dsp.mission.id.sandoria.INFILTRATE_DAVOI);

    if (CurrentMission == dsp.mission.id.sandoria.THE_DAVOI_REPORT and player:getCharVar("MissionStatus") == 0) then
        player:startEvent(100);
    elseif (CurrentMission == dsp.mission.id.sandoria.THE_DAVOI_REPORT and player:hasKeyItem(dsp.ki.LOST_DOCUMENT)) then
        player:startEvent(104);
    elseif (CurrentMission == dsp.mission.id.sandoria.INFILTRATE_DAVOI and infiltrateDavoi and player:getCharVar("MissionStatus") == 0) then
        player:startEvent(102);
    elseif (CurrentMission == dsp.mission.id.sandoria.INFILTRATE_DAVOI and player:getCharVar("MissionStatus") == 9) then
        player:startEvent(105);
    else
        player:startEvent(101);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 100) then
        player:setCharVar("MissionStatus",1);
    elseif (csid == 104) then
        player:setCharVar("MissionStatus",3);
        player:delKeyItem(dsp.ki.LOST_DOCUMENT);
        player:addKeyItem(dsp.ki.TEMPLE_KNIGHTS_DAVOI_REPORT);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.TEMPLE_KNIGHTS_DAVOI_REPORT);
    elseif (csid == 102) then
        player:setCharVar("MissionStatus",6);
    elseif (csid == 105) then
        player:setCharVar("MissionStatus",10);
        player:delKeyItem(dsp.ki.EAST_BLOCK_CODE);
        player:delKeyItem(dsp.ki.SOUTH_BLOCK_CODE);
        player:delKeyItem(dsp.ki.NORTH_BLOCK_CODE);
    end

end;