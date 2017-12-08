----------------------------------
-- Area: Cape Teriggan
--  NM:  Kreutzet
-----------------------------------

require("scripts/globals/weather");

function onMobWeaponSkill(target, mob, skill)
    if (skill:getID() == 926) then
        local stormwindCounter = mob:getLocalVar("stormwindCounter");

        stormwindCounter = stormwindCounter +1;
        mob:setLocalVar("stormwindCounter", stormwindCounter);
        mob:setLocalVar("stormwindDamage", stormwindCounter); -- extra var for dmg calculation (in stormwind.lua)

        if (stormwindCounter > 2) then
            mob:setLocalVar("stormwindCounter", 0);
        else
            mob:useMobAbility(926);
        end
    end;
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    -- Set Kruetzet's spawnpoint and respawn time (9-12 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(32400,43200));
end;

function onMobDisengage(mob, weather)
    if (weather ~= WEATHER_WIND and weather ~= WEATHER_GALE) then
        DespawnMob(mob:getID());
    end
end;
