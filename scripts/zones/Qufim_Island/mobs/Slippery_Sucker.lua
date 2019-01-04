-----------------------------------
-- Area: Qufim Island
--   NM: Slippery Sucker
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, player)
    if math.random(100) > 20 or applyResistanceAddEffect(mob, player, dsp.magic.ele.THUNDER, dsp.effect.STUN) <= 0.5 then
        return 0, 0, 0
    else
        if not player:hasStatusEffect(dsp.effect.STUN) then
            player:addStatusEffect(dsp.effect.STUN, 0, 0, 5 * resist)
        end
        return dsp.subEffect.STUN, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.STUN
    end
end

function onMobDeath(mob, player, isKiller)
end
