-----------------------------------
-- Area: Toraimarai Canal
--   NM: Konjac
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.HP_DRAIN, {chance = 20})
end

function onMobDeath(mob, player, isKiller)
end
