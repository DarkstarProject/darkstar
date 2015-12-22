-----------------------------------
-- Area: Davoi
-- NPC:  Zantaviat
-- Involved in Mission: The Davoi Report
-- @pos 215 0.1 -10 149
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/zones/Davoi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local CurrentMission = player:getCurrentMission(SANDORIA);
    local infiltrateDavoi = player:hasCompletedMission(SANDORIA,INFILTRATE_DAVOI);
    
    if (CurrentMission == THE_DAVOI_REPORT and player:getVar("MissionStatus") == 0) then
        player:startEvent(0x0064);
    elseif (CurrentMission == THE_DAVOI_REPORT and player:hasKeyItem(LOST_DOCUMENT)) then
        player:startEvent(0x0068);
    elseif (CurrentMission == INFILTRATE_DAVOI and infiltrateDavoi and player:getVar("MissionStatus") == 0) then
        player:startEvent(0x0066);
    elseif (CurrentMission == INFILTRATE_DAVOI and player:getVar("MissionStatus") == 9) then
        player:startEvent(0x0069);
    else
        player:startEvent(0x0065);
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if (csid == 0x0064) then
        player:setVar("MissionStatus",1);
    elseif (csid == 0x0068) then
        player:setVar("MissionStatus",3);
        player:delKeyItem(LOST_DOCUMENT);
        player:addKeyItem(TEMPLE_KNIGHTS_DAVOI_REPORT);
        player:messageSpecial(KEYITEM_OBTAINED,TEMPLE_KNIGHTS_DAVOI_REPORT);
    elseif (csid == 0x0066) then
        player:setVar("MissionStatus",6);
    elseif (csid == 0x0069) then
        player:setVar("MissionStatus",10);
        player:delKeyItem(EAST_BLOCK_CODE);
        player:delKeyItem(SOUTH_BLOCK_CODE);
        player:delKeyItem(NORTH_BLOCK_CODE);
    end

end;