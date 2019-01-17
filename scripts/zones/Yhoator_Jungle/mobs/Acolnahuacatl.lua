-----------------------------------
-- Area: Yhoator Jungle
--   NM: Acolnahuacatl
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, player)
    local resist = applyResistanceAddEffect(mob, player, dsp.magic.ele.THUNDER, dsp.effect.STUN)

    if math.random(100) > 20 or resist <= 0.5 then
        return 0, 0, 0
    else
        local duration = 5
        duration = duration * resist

        if not player:hasStatusEffect(dsp.effect.STUN) then
            player:addStatusEffect(dsp.effect.STUN, 0, 0, duration)
        end

        return dsp.subEffect.STUN, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.STUN
    end
end

function onMobDeath(mob, player, isKiller)
end
