-----------------------------------
-- Area: Chamber of Oracles
-- MOB: Nanaa Mihgo
-- AMK 10 BCNM
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    mob:addMod(dsp.mod.TRIPLE_ATTACK, 30)
    mob:addMod(dsp.mod.REGEN, 100)
    dsp.mix.jobSpecial.config(mob, {
    specials =
        {
            {
                id = dsp.jsa.PERFECT_DODGE
            },
        },
    })
end

function onAdditionalEffect(mob, target, damage)
    local effects = { dsp.mob.ae.PARALYZE, dsp.mob.ae.SILENCE, dsp.mob.ae.STUN, dsp.mob.ae.POISON }
    local randomEffect = effects[math.random(#effects)]
    return dsp.mob.onAddEffect(mob, target, damage, randomEffect)
end

function onMobDeath(mob, player, isKiller)
end
