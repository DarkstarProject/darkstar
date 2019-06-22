---------------------------------------------
-- Remove Poison
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")

---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(pet, target, skill, action)
    if (target:delStatusEffect(dsp.effect.POISON)) then
        skill:setMsg(dsp.msg.basic.JA_REMOVE_EFFECT)
    else
        skill:setMsg(dsp.msg.basic.JA_NO_EFFECT)
    end
    return dsp.effect.POISON
end
