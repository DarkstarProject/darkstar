---------------------------------------------------
-- Remove Curse
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onUseAbility(pet, target, skill, action)
    local effect
    if (target:delStatusEffect(EFFECT_CURSE_I)) then
        skill:setMsg(123);
        effect = EFFECT_CURSE_I
    elseif (target:delStatusEffect(EFFECT_DOOM)) then
        skill:setMsg(123);
        effect = EFFECT_DOOM
    else
        skill:setMsg(156);
    end

    return effect;
end
