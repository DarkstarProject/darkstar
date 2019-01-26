-----------------------------------
-- Area: Bhaflau Thickets
--   NM: Harvestman
-- !pos 398.130 -10.675 179.169 52
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1);
end;

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.POISON, {power = 100, duration = math.random(6, 9)})
end

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    -- Set Harvesman's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));
end;
