-----------------------------------
-- Ability: Diabolic Eye
-- Reduces max. HP, increases accuracy.
-- Obtained: Dark Knight Level 75
-- Recast Time: 0:05:00
-- Duration: 0:03:00
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player, target, ability)
    player:addStatusEffect(EFFECT_DIABOLIC_EYE,player:getMerit(MERIT_DIABOLIC_EYE),0,180);
end;