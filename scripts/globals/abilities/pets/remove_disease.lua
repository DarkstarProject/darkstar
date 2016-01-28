---------------------------------------------------
-- Remove Disease
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onUseAbility(pet, target, skill, action)
    local effect
    if (target:delStatusEffect(EFFECT_DISEASE)) then
        skill:setMsg(123);
        effect = EFFECT_DISEASE
    elseif (target:delStatusEffect(EFFECT_PLAGUE)) then
        skill:setMsg(123);
        effect = EFFECT_PLAGUE
    else
        skill:setMsg(156);
    end

    return effect;
end
