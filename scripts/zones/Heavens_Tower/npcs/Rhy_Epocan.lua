-----------------------------------
-- Area: Heavens Tower
--  NPC: Rhy Epocan
-- Involved in Mission 3-1
-- !pos 2 -48 14 242
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Heavens_Tower/TextIDs");
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
    else
        player:startEvent(93);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
printf("RESULT: %u",option);

    if (csid == 107) then
        player:setVar("MissionStatus",2);
    elseif (csid == 114) then
        finishMissionTimeline(player,2,csid,option);
    end

end;