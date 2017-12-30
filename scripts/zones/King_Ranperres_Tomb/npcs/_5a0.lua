-----------------------------------
-- Area: King Ranperre's Tomb
-- DOOR: _5a0 (Heavy Stone Door)
-- !pos -39.000 4.823 20.000 190
-----------------------------------
package.loaded["scripts/zones/King_Ranperres_Tomb/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/King_Ranperres_Tomb/TextIDs");
require("scripts/zones/King_Ranperres_Tomb/MobIDs");
require("scripts/globals/missions");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local currentMission = player:getCurrentMission(SANDORIA);
    local MissionStatus = player:getVar("MissionStatus");

    if (currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 1 and not GetMobByID(CORRUPTED_YORGOS):isSpawned()
        and not GetMobByID(CORRUPTED_SOFFEIL):isSpawned() and not GetMobByID(CORRUPTED_ULBRIG):isSpawned()) then
        if (player:getVar("Mission6-2MobKilled") == 1) then
            player:setVar("Mission6-2MobKilled",0);
            player:setVar("MissionStatus",2);
        else
            SpawnMob(CORRUPTED_YORGOS);
            SpawnMob(CORRUPTED_SOFFEIL);
            SpawnMob(CORRUPTED_ULBRIG);
        end
    elseif (currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 2) then
         player:startEvent(6);
    elseif (currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 3) then
         player:startEvent(7);
    elseif (currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 8) then
         player:startEvent(5);
    elseif (currentMission == THE_HEIR_TO_THE_LIGHT and MissionStatus == 6) then
         player:startEvent(14);

    else
        player:messageSpecial(HEAVY_DOOR);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 5) then
        player:setVar("MissionStatus",9);
    elseif (csid == 14) then
        player:setVar("MissionStatus",7);
    -- at this point 3 optional cs are available and open until watched (add 3 var to char?)
    end
end;
