-----------------------------------
-- Area: Yhoator Jungle
--  NM:  Bright-handed Kunberry
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,133,1);

    local kills = ally:getVar("EVERYONES_GRUDGE_KILLS");
    if (kills < 480) then
        ally:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
    end

    -- Set Bright-handed Kunberry's spawnpoint and respawn time (21-21.5 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,77400));
end;