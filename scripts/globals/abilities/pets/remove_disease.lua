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
    if (target:delStatusEffect(EFFECT_DISEASE)) then
        skill:setMsg(msgBasic.JA_REMOVE_EFFECT);
        effect = EFFECT_DISEASE
    elseif (target:delStatusEffect(EFFECT_PLAGUE)) then
        skill:setMsg(msgBasic.JA_REMOVE_EFFECT);
        effect = EFFECT_PLAGUE
    else
        skill:setMsg(msgBasic.JA_NO_EFFECT);
    end

    return effect;
end
