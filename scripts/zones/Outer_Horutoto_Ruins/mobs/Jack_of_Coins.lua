-----------------------------------
-- Area: Outer Horutoto Ruins
--  MOB: Jack of Coins
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/missions");
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("popTime", os.time())
end;

function onMobRoam(mob)
    local spawnTime = mob:getLocalVar("popTime");

    if (os.time() - spawnTime > 180) then
        DespawnMob(mob:getID());
    end

end;

function onMobDeath(mob, player, isKiller)
    local CurrentMission = player:getCurrentMission(WINDURST);
    local MissionStatus = player:getVar("MissionStatus");

    if (CurrentMission == FULL_MOON_FOUNTAIN and MissionStatus == 1) then
        player:setVar("MissionStatus",2);
    end
end;