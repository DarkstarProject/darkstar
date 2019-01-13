-----------------------------------
-- Area: Batallia Downs
--   NM: Eyegouger
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, player)
    local resist = applyResistanceAddEffect(mob, player, dsp.magic.ele.DARK, dsp.effect.BLINDNESS)

    if math.random(100) > 20 or resist <= 0.5 then
        return 0, 0, 0
    else
        local duration = 30
        duration = duration * resist

        if not player:hasStatusEffect(dsp.effect.BLINDNESS) then
            player:addStatusEffect(dsp.effect.BLINDNESS, 0, 0, duration)
        end

        return dsp.subEffect.BLIND, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.BLINDNESS
    end
end

function onMobDeath(mob, player, isKiller)
end
