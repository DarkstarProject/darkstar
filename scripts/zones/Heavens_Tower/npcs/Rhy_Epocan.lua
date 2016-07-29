-----------------------------------
-- Area: Heavens Tower
-- NPC:  Rhy Epocan
-- Involved in Mission 3-1
-- @pos 2 -48 14 242
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Heavens_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local currentMission = player:getCurrentMission(WINDURST);
    local MissionStatus = player:getVar("MissionStatus");
    
    if (currentMission == TO_EACH_HIS_OWN_RIGHT and MissionStatus == 1) then
        player:startEvent(0x006B);
    elseif (currentMission == TO_EACH_HIS_OWN_RIGHT and MissionStatus == 2) then
        player:startEvent(0x006C);
    elseif (currentMission == TO_EACH_HIS_OWN_RIGHT and MissionStatus == 4) then
        player:startEvent(0x0072);
    else
        player:startEvent(0x005d);
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
printf("RESULT: %u",option);
    
    if (csid == 0x006B) then
        player:setVar("MissionStatus",2);
    elseif (csid == 0x0072) then
        finishMissionTimeline(player,2,csid,option);
    end
    
end;