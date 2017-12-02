-----------------------------------
-- Area: Metalworks
--  NPC: Karst
-- Type: President
-- Involved in Bastok Missions 5-2
-- !pos 106 -21 0 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local currentMission = player:getCurrentMission(BASTOK);

    if (currentMission == XARCABARD_LAND_OF_TRUTHS and player:getVar("MissionStatus") == 0) then
        player:startEvent(602);
    elseif (currentMission == XARCABARD_LAND_OF_TRUTHS and player:hasKeyItem(SHADOW_FRAGMENT)) then
        player:startEvent(603);
    elseif (currentMission == ON_MY_WAY) and (player:getVar("MissionStatus") == 0) then
        player:startEvent(765);
    elseif (currentMission == ON_MY_WAY) and (player:getVar("MissionStatus") == 3) then
        player:startEvent(766);
    else
        player:startEvent(601);
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
    -- printf("RESULT: %u",option);
    if (csid == 602) then
        player:setVar("MissionStatus",2);
    elseif (csid == 765) then
        player:setVar("MissionStatus",1);
    elseif (csid == 766 or csid == 603) then
        finishMissionTimeline(player, 1, csid, option);
    end
end;