-----------------------------------
-- Area: Yhoator Jungle
--  NM:  Bisque-heeled Sunberry
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/globals/fieldsofvalor");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,133,1);
end;

function onMobDespawn(mob)
    -- Set Bisque-heeled Sunberry's spawnpoint and respawn time (1-2 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(3600,7200));
end;
