---------------------------------------------
-- Remove Curse
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");

---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onUseAbility(pet, target, skill, action)
    local effect
    if (target:delStatusEffect(EFFECT.CURSE_I)) then
        skill:setMsg(msgBasic.JA_REMOVE_EFFECT);
        effect = EFFECT.CURSE_I
    elseif (target:delStatusEffect(EFFECT.DOOM)) then
        skill:setMsg(msgBasic.JA_REMOVE_EFFECT);
        effect = EFFECT.DOOM
    else
        skill:setMsg(msgBasic.JA_NO_EFFECT);
    end

    return effect;
end
