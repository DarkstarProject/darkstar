-----------------------------------
-- Area: King Ranperre's Tomb
-- DOOR: _5a0 (Heavy Stone Door)
-- !pos -39.000 4.823 20.000 190
-----------------------------------
local ID = require("scripts/zones/King_Ranperres_Tomb/IDs");
require("scripts/globals/missions");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local currentMission = player:getCurrentMission(SANDORIA);
    local MissionStatus = player:getVar("MissionStatus");

    if (currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 1 and not GetMobByID(ID.mob.CORRUPTED_YORGOS):isSpawned()
        and not GetMobByID(ID.mob.CORRUPTED_SOFFEIL):isSpawned() and not GetMobByID(ID.mob.CORRUPTED_ULBRIG):isSpawned()) then
        if (player:getVar("Mission6-2MobKilled") == 1) then
            player:setVar("Mission6-2MobKilled",0);
            player:setVar("MissionStatus",2);
        else
            SpawnMob(ID.mob.CORRUPTED_YORGOS);
            SpawnMob(ID.mob.CORRUPTED_SOFFEIL);
            SpawnMob(ID.mob.CORRUPTED_ULBRIG);
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
        player:messageSpecial(ID.text.HEAVY_DOOR);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 5) then
        player:setVar("MissionStatus",9);
    elseif (csid == 14) then
        player:setVar("MissionStatus",7);
    -- at this point 3 optional cs are available and open until watched (add 3 var to char?)
    end
end;
