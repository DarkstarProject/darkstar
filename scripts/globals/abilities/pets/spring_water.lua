---------------------------------------------
-- Spring Water
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill)
    local base = 47 + pet:getMainLvl()*3
    local tp = skill:getTP()
    if tp < 1000 then
        tp = 1000
    end
    base = base * tp / 1000

    if (target:getHP()+base > target:getMaxHP()) then
        base = target:getMaxHP() - target:getHP() --cap it
    end
    target:delStatusEffect(dsp.effect.BLINDNESS)
    target:delStatusEffect(dsp.effect.POISON)
    target:delStatusEffect(dsp.effect.PARALYSIS)
    target:delStatusEffect(dsp.effect.DISEASE)
    target:delStatusEffect(dsp.effect.PETRIFICATION)
        target:wakeUp()
    target:delStatusEffect(dsp.effect.SILENCE)
    if math.random() > 0.5 then
        target:delStatusEffect(dsp.effect.SLOW)
    end
    skill:setMsg(dsp.msg.basic.SELF_HEAL)
    target:addHP(base)
    return base
end
