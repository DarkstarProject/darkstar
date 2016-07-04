-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Corrupted Yorgos
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local currentMission = player:getCurrentMission(SANDORIA);
    local MissionStatus = player:getVar("MissionStatus");

    if (currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 1) then
        player:setVar("Mission6-2MobKilled",1);
    end
end;