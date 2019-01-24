-----------------------------------
-- Area: Mount Zhayolm
--   NM: Ignamoth
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    mob:setMod(dsp.mod.DOUBLE_ATTACK, 50)
    mob:setMod(dsp.mod.REGAIN, 200)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.PARALYZE, {duration = 60})
end

function onMobDeath(mob)
end
