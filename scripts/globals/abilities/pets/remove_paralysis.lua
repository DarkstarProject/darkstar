---------------------------------------------------
-- Remove Paralysis
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, master, action)
    action:actionID(645)
    if (target:delStatusEffect(EFFECT_PARALYSIS)) then
        skill:setMsg(123);
    else
        skill:setMsg(156);
    end
    return EFFECT_PARALYSIS;
end
