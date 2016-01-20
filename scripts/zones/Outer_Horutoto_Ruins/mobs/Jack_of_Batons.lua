-----------------------------------
-- Area: Outer Horutoto Ruins
--  MOB: Jack of Batons
-----------------------------------

require("scripts/globals/titles");
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
    local CurrentMission = ally:getCurrentMission(WINDURST);
    local MissionStatus = ally:getVar("MissionStatus");

    if (CurrentMission == FULL_MOON_FOUNTAIN and MissionStatus == 1) then
        ally:setVar("MissionStatus",2);
    end
end;