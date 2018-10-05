-----------------------------------
-- Area: Yhoator Jungle
--  NM:  Bisque-heeled Sunberry
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/globals/regimes")

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 133, 1, dsp.regime.type.FIELDS)
end;

function onMobDespawn(mob)
    -- Set Bisque-heeled Sunberry's spawnpoint and respawn time (1-2 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(3600,7200));
end;
