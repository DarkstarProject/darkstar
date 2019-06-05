-----------------------------------
-- Area: Outer Horutoto Ruins
--   NM: Legalox Heftyhind
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    mob:setMod(dsp.mod.DOUBLE_ATTACK, 75) -- "Has a high but not 100% Double Attack rate."
end

function onMobSpawn(mob)
    mob:addStatusEffect(dsp.effect.STONESKIN, 100, 0, 300) -- "Spawns with the effect of Stoneskin."
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.SLOW) -- "Physical attacks have an additional effect: Slow, but does not always activate."
end

function onMobDeath(mob, player, isKiller)
end
