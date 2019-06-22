---------------------------------------------
-- Earthen Ward
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
    target:delStatusEffect(dsp.effect.STONESKIN)
    local amount = pet:getMainLvl()*2 + 50
    target:addStatusEffect(dsp.effect.STONESKIN,amount,0,900,0,0,3)
    skill:setMsg(dsp.msg.basic.SKILL_GAIN_EFFECT)
    return dsp.effect.STONESKIN
end
