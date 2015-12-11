-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Corrupted Ulbrig
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

function onMobDeath(mob, killer, ally)
    local currentMission = ally:getCurrentMission(SANDORIA);
    local MissionStatus = ally:getVar("MissionStatus");

    if (currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 1) then
        ally:setVar("Mission6-2MobKilled",1);
    end
end;