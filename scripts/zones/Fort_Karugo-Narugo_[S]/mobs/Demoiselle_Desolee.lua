-----------------------------------
-- Area: Fort Karugo-Narugo [S]
--   NM: Demoiselle Desolee
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, player)
    local resist = applyResistanceAddEffect(mob, player, dsp.magic.ele.ICE, dsp.effect.PARALYSIS)

    if resist <= 0.5 then
        return 0,0,0
    else
        local duration = 60
        local power = 20
        duration = duration * resist
        if not player:hasStatusEffect(dsp.effect.PARALYSIS) then
            player:addStatusEffect(dsp.effect.PARALYSIS, power, 0, duration)
        end
        return dsp.subEffect.PARALYSIS, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.PARALYSIS
    end
end

function onMobDeath(mob, player, isKiller)
end
