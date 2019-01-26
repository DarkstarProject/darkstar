-----------------------------------------
-- ID: 16497
-- Item: Sleep Dagger
-- Additional Effect: Sleep
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,dsp.magic.ele.DARK,0) <= 0.5) then
        return 0,0,0
    else
        local duration = 25
        if (target:getMainLvl() > player:getMainLvl()) then
            duration = duration - (target:getMainLvl() - player:getMainLvl())
        end
        duration = utils.clamp(duration,1,25)
        duration = duration * applyResistanceAddEffect(player,target,dsp.magic.ele.DARK,0)
        if (not target:hasStatusEffect(dsp.effect.SLEEP_I)) then
            target:addStatusEffect(dsp.effect.SLEEP_I, 1, 0, duration)
        end
        return dsp.subEffect.SLEEP, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.SLEEP_I
    end
end