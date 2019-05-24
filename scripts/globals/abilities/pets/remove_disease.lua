---------------------------------------------
-- Remove Disease
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")

---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(pet, target, skill, action)
    local effect
    if (target:delStatusEffect(dsp.effect.DISEASE)) then
        skill:setMsg(dsp.msg.basic.JA_REMOVE_EFFECT)
        effect = dsp.effect.DISEASE
    elseif (target:delStatusEffect(dsp.effect.PLAGUE)) then
        skill:setMsg(dsp.msg.basic.JA_REMOVE_EFFECT)
        effect = dsp.effect.PLAGUE
    else
        skill:setMsg(dsp.msg.basic.JA_NO_EFFECT)
    end

    return effect
end
