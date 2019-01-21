-----------------------------------
-- Area: Uleguerand Range
--   NM: Bonnacon
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    if math.random(100) >= 66 or target:hasStatusEffect(dsp.effect.STUN) then
        return 0, 0, 0
    else
        local duration = math.random(5, 15)
        target:addStatusEffect(dsp.effect.STUN, 5, 0, duration)
        return dsp.subEffect.STUN, 0, dsp.effect.STUN
    end
end

function onMobDeath(mob, player, isKiller)
end
