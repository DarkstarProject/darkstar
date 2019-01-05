-----------------------------------
-- Area: Beaucedine Glacier (S)
--   NM: Grand'Goule
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, player)
    local chance = 25
    local resist = applyResistanceAddEffect(mob,player,dsp.magic.ele.EARTH,dsp.effect.PETRIFICATION)

    if math.random(0,99) >= chance or resist <= 0.5 then
        return 0,0,0
    else
        local duration = 30
        if mob:getMainLvl() > player:getMainLvl() then
            duration = duration + mob:getMainLvl() - player:getMainLvl()
        end
        duration = utils.clamp(duration, 1, 45)
        duration = duration * resist
        if not player:hasStatusEffect(dsp.effect.PETRIFICATION) then
            player:addStatusEffect(dsp.effect.PETRIFICATION, 1, 0, duration)
        end
        return dsp.subEffect.PETRIFY, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.PETRIFICATION
    end
end

function onMobDeath(mob, player, isKiller)
end
