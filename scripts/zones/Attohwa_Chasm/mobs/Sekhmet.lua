-----------------------------------
-- Area: Attohwa Chasm
--   NM: Sekhmet
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1);
    mob:setMod(dsp.mod.DOUBLE_ATTACK, 10);
    mob:setMod(dsp.mod.FASTCAST, 15);
end;

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.MP_DRAIN, {power = math.random(1, 10)})
end

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(5400,7200)); -- 1.5 to 2 hours.
    UpdateNMSpawnPoint(mob:getID());
end;
