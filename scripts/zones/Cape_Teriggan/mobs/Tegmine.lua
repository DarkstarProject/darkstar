-----------------------------------
-- Area: Cape Teriggan
--   NM: Tegmine
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1);
end;

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.ENWATER)
end

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    -- UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((7200),(7800))); -- 120 to 130 min
end;
