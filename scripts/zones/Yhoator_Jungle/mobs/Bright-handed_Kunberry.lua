-----------------------------------
-- Area: Yhoator Jungle
--  NM:  Bright-handed Kunberry
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/globals/regimes")

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 133, 1, dsp.regime.type.FIELDS)
end;

function onMobDespawn(mob)
    -- Set Bright-handed Kunberry's spawnpoint and respawn time (21-21.5 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,77400));
end;
