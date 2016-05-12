-----------------------------------
-- Area: Outer Horutoto Ruins
--  MOB: Jack of Cups
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

function onMobDeath(mob, player, isKiller)
    local CurrentMission = player:getCurrentMission(WINDURST);
    local MissionStatus = player:getVar("MissionStatus");

    if (CurrentMission == FULL_MOON_FOUNTAIN and MissionStatus == 1) then
        player:setVar("MissionStatus",2);
    end
end;