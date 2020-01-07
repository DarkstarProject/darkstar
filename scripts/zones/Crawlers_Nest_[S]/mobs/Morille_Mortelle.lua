-----------------------------------
-- Area: Crawler's Nest [S] (171)
--   NM: Morille Mortelle
-- !pos 59.788 -0.939 22.316 171
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:setMod(dsp.mod.DOUBLE_ATTACK, 20);
    mob:setMod(dsp.mod.STORETP, 10);
end;

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.PLAGUE)
end

function onMobDeath(mob, player, isKiller)
end;
