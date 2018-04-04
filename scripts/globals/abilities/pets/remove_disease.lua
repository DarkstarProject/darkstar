---------------------------------------------
-- Remove Disease
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");

---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onUseAbility(pet, target, skill, action)
    local effect
    if (target:delStatusEffect(dsp.effects.DISEASE)) then
        skill:setMsg(msgBasic.JA_REMOVE_EFFECT);
        effect = dsp.effects.DISEASE
    elseif (target:delStatusEffect(dsp.effects.PLAGUE)) then
        skill:setMsg(msgBasic.JA_REMOVE_EFFECT);
        effect = dsp.effects.PLAGUE
    else
        skill:setMsg(msgBasic.JA_NO_EFFECT);
    end

    return effect;
end
