-----------------------------------
-- Area: Toraimorai Canal
--   NM: Canal Moocher
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, player)
    local resist = applyResistanceAddEffect(mob, player, dsp.magic.ele.WATER, dsp.effect.PLAGUE)

    if math.random(100) > 25 or resist <= 0.5 then
        return 0, 0, 0
    else
        local duration = 30
        if mob:getMainLvl() > player:getMainLvl() then
            duration = duration + mob:getMainLvl() - player:getMainLvl()
        end
        duration = utils.clamp(duration, 1, 45)
        duration = duration * resist

        if not player:hasStatusEffect(dsp.effect.PLAGUE) then
            player:addStatusEffect(dsp.effect.PLAGUE, 1, 0, duration)
        end

        return dsp.subEffect.PLAGUE, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.PLAGUE
    end
end

function onMobDeath(mob, player, isKiller)
end
