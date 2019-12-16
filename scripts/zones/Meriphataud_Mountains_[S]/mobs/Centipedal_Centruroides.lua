-----------------------------------
-- Area: Meriphataud Mountains [S]
--   NM: Centipedal Centruroides
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    mob:setMod(dsp.mod.DOUBLE_ATTACK, 100)
    mob:setMod(dsp.mod.MOVE, 13)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.POISON, {power = 30})
end

function onMobDeath(mob, player, isKiller)
end
