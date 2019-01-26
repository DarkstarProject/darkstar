-----------------------------------
-- Area: Heavens Tower
--  NPC: Rhy Epocan
-- Involved in Mission 3-1
-- !pos 2 -48 14 242
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local currentMission = player:getCurrentMission(WINDURST);
    local MissionStatus = player:getVar("MissionStatus");

    if (currentMission == TO_EACH_HIS_OWN_RIGHT and MissionStatus == 1) then
        player:startEvent(107);
    elseif (currentMission == TO_EACH_HIS_OWN_RIGHT and MissionStatus == 2) then
        player:startEvent(108);
    elseif (currentMission == TO_EACH_HIS_OWN_RIGHT and MissionStatus == 4) then
        player:startEvent(114);
    elseif (player:getCurrentMission(WINDURST) == MOON_READING and (MissionStatus >= 3 or player:hasCompletedMission(WINDURST, MOON_READING))) then
        player:startEvent(405);
    else
        player:startEvent(93);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
printf("RESULT: %u",option);

    if (csid == 107) then
        player:setVar("MissionStatus",2);
    elseif (csid == 114) then
        finishMissionTimeline(player,2,csid,option);
    elseif (csid == 405) then
        player:setVar("MilitaryStrength",0);
    end

end;