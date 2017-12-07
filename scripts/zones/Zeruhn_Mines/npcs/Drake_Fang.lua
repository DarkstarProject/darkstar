-----------------------------------
-- Area: Zeruhn Mines
-- NPC:  Drake Fang
-- Involved in Mission: Bastok 6-1, 8-2
-- !pos -74 0.1 58 172
-----------------------------------
package.loaded["scripts/zones/Zeruhn_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Zeruhn_Mines/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/globals/titles");

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
    local MissionStatus = player:getVar("MissionStatus");

    -- Enter the Talekeeper 8-2
    if (currentMission == ENTER_THE_TALEKEEPER and MissionStatus == 4 ) then
        player:startEvent(204);
    elseif (currentMission == ENTER_THE_TALEKEEPER and MissionStatus > 1 and MissionStatus < 4 ) then
        player:startEvent(203);
    elseif (currentMission == ENTER_THE_TALEKEEPER and MissionStatus == 0) then
        player:startEvent(202);
    -- Return of the Talekeeper 6-1
    elseif (currentMission == RETURN_OF_THE_TALEKEEPER and MissionStatus > 1) then
        player:startEvent(201);
    elseif (currentMission == RETURN_OF_THE_TALEKEEPER and MissionStatus == 1) then
        player:startEvent(200);
    else
        player:startEvent(108);
    end
end;
-- 108  200  201  202  203  204

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

    if (csid == 200) then
        player:setVar("MissionStatus",2);
    elseif (csid == 202) then
        player:setVar("Missionstatus",1);
    elseif (csid == 204) then
        player:setVar("Missionstatus",5);
        player:delKeyItem(OLD_PIECE_OF_WOOD);
        player:setPos(23,0,4);
    end
end;
