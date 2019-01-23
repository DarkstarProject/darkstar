-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--   NM: Elusive Edwin
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    if math.random(100) > 20 or applyResistanceAddEffect(mob, target, dsp.magic.ele.WIND, dsp.effect.SILENCE) <= 0.5 then
        return 0, 0, 0
    else
        local duration = 30
        if mob:getMainLvl() > target:getMainLvl() then
            duration = duration + mob:getMainLvl() - target:getMainLvl()
        end
        duration = utils.clamp(duration, 1, 30)
        duration = duration * resist

        if not target:hasStatusEffect(dsp.effect.SILENCE) then
            target:addStatusEffect(dsp.effect.SILENCE, 1, 0, duration)
        end

        return dsp.subEffect.SILENCE, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.SILENCE
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(7200 + math.random(0, 600)) -- 2 hours, then 10 minute window
end
