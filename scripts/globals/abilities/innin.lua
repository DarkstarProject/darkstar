-----------------------------------
-- Ability: Innin
-- Reduces enmity and impairs evasion. Grants a bonus to accuracy, critical hit rate, and ninjutsu damage when striking target from behind.
-- Obtained: Ninja Level 40
-- Recast Time: 3:00
-- Duration: 5:00
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

function onUseAbility(player,target,ability)
    target:delStatusEffect(EFFECT_INNIN);
    target:delStatusEffect(EFFECT_YONIN);
    target:addStatusEffect(EFFECT_INNIN,30,15,300,0,20);
end;