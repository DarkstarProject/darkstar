-----------------------------------
-- Area: Alzadaal Undersea Ruins (72)
--   NM: Cookieduster Lipiroon
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob,target,damage)
    if math.random(100) >= 20 or target:hasStatusEffect(dsp.effect.POISON) then
        return 0,0,0
    else
        target:addStatusEffect(dsp.effect.POISON, 70, 3, 30)
        return dsp.subEffect.POISON, 0, dsp.effect.POISON
    end
end

function onMobDeath(mob, player, isKiller)
end
