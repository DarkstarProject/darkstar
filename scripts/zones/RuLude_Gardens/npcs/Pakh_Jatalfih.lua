-----------------------------------
--    Area: Ru'Lud Gardens
--    NPC:  Pakh Jatalfih
--    @pos 34 8 -35 243
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    pNation = player:getNation();
    
    if (pNation == WINDURST) then
        currentMission = player:getCurrentMission(pNation);
        MissionStatus = player:getVar("MissionStatus");
        
        if (currentMission == A_NEW_JOURNEY and MissionStatus == 1) then
            player:startEvent(0x002B);
        elseif (currentMission == A_NEW_JOURNEY and MissionStatus == 2) then
            player:startEvent(0x0044);
        elseif (currentMission == A_NEW_JOURNEY and MissionStatus == 3) then
            player:startEvent(0x008D);
        elseif (player:getRank() == 4 and MissionStatus == 0) then
            if (getMissionRankPoints(player,13) == 1) then
                player:startEvent(0x0032);
            else
                player:startEvent(0x0036);
            end
        elseif (player:getRank() == 4 and player:getCurrentMission(WINDURST) == 255 and MissionStatus ~= 0 and getMissionRankPoints(player,13) == 1) then
            player:startEvent(0x0086);
        elseif (currentMission == MAGICITE and MissionStatus == 2) then
            player:startEvent(0x0089);
        elseif (currentMission == MAGICITE and MissionStatus == 6) then
            player:startEvent(0x0025);
        elseif (player:hasKeyItem(MESSAGE_TO_JEUNO_WINDURST)) then
            player:startEvent(0x0039);
        elseif (player:getRank() >= 5) then
            player:startEvent(0x0039);
        else
            player:startEvent(0x006b);
        end
    elseif (pNation == SANDORIA) then
        player:startEvent(0x0034);
    elseif (pNation == BASTOK) then
        player:startEvent(0x0033);
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
    
    if (csid == 0x002B) then
        player:setVar("MissionStatus",2);
    elseif (csid == 0x008D) then
        player:setVar("MissionStatus",4);
    elseif (csid == 0x0025) then
        finishMissionTimeline(player,1,csid,option);
    end
    
end;