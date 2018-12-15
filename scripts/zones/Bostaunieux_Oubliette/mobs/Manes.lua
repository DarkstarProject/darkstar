----------------------------------
-- Area: Bostaunieux Oubliette (167)
--   NM: Manes
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    if math.random(1, 100) < 20 or target:hasStatusEffect(dsp.effect.TERROR) then
        return 0,0,0
    else
        target:addStatusEffect(dsp.effect.TERROR, 1, 0, 5)
        return dsp.subEffect.NONE, 0, dsp.effect.TERROR
    end
end

function onMobDeath(mob, player, isKiller)
end
