-----------------------------------
-- Area: Eastern Altepa Desert
--   NM: Sabotender Corrido
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    mob:setMod(dsp.mod.DOUBLE_ATTACK, 25)
    mob:setMod(dsp.mod.MOVE, 25)
end

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = dsp.jsa.HUNDRED_FISTS, hpp = 25},
        },
    })
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.SLOW)
end

function onMobDeath(mob, player, isKiller)
end
