---------------------------------------------------
-- Remove Poison
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, master, action)
    action:actionID(643)
    if (target:delStatusEffect(EFFECT_POISON)) then
        skill:setMsg(123);
    else
        skill:setMsg(156);
    end
    return EFFECT_POISON;
end
