-----------------------------------
-- Area: Heavens Tower
-- NPC:  Zubaba
-- Involved in Mission 3-2
-- @pos 15 -27 18 242
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Heavens_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    local currentMission = player:getCurrentMission(WINDURST);
    local nextMissionFinished = player:hasCompletedMission(WINDURST,A_NEW_JOURNEY);
    
    if (currentMission == WRITTEN_IN_THE_STARS and player:getVar("MissionStatus") == 3) then
        if (trade:hasItemQty(16447,3) and trade:getItemCount() == 3) then -- Trade Rusty Dagger
            player:tradeComplete();
            player:startEvent(0x0097);
        end
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local currentMission = player:getCurrentMission(WINDURST);
    local MissionStatus = player:getVar("MissionStatus");
    local nextMissionFinished = player:hasCompletedMission(WINDURST,A_NEW_JOURNEY);
    
    if (currentMission == WRITTEN_IN_THE_STARS and nextMissionFinished == false) then
        if (MissionStatus == 0) then
            player:startEvent(0x0079);
        elseif (MissionStatus == 1) then
            player:startEvent(0x007a);
        elseif (MissionStatus == 2) then
            player:startEvent(0x0087);
        end
    elseif (currentMission == WRITTEN_IN_THE_STARS and (nextMissionFinished or player:hasCompletedMission(WINDURST,WRITTEN_IN_THE_STARS))) then
        if (MissionStatus == 0) then
            player:startEvent(0x0101,0,16447); -- Rusty Dagger
        elseif (MissionStatus == 3) then
            player:startEvent(0x0096,0,16447);
        end
    elseif (player:hasKeyItem(STAR_CRESTED_SUMMONS)) then
        player:startEvent(0x009d);
    elseif (currentMission == THE_SHADOW_AWAITS and player:hasKeyItem(SHADOW_FRAGMENT)) then
        player:startEvent(0x00C2); -- her reaction after 5-1.
    else
        player:startEvent(0x0038);
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
    
    if (csid == 0x0079) then
        player:addKeyItem(CHARM_OF_LIGHT);
        player:messageSpecial(KEYITEM_OBTAINED,CHARM_OF_LIGHT);
        player:setVar("MissionStatus",1);
    elseif (csid == 0x0095 or csid == 0x0101) then
        player:setVar("MissionStatus",3);
    elseif (csid == 0x0087 or csid == 0x0097) then
        finishMissionTimeline(player,1,csid,option);
    end
    
end;