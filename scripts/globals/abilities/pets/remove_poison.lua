---------------------------------------------
-- Remove Poison
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");

---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onUseAbility(pet, target, skill, action)
    if (target:delStatusEffect(EFFECT_POISON)) then
        skill:setMsg(msgBasic.JA_REMOVE_EFFECT);
    else
        skill:setMsg(msgBasic.JA_NO_EFFECT);
    end
    return EFFECT_POISON;
end
