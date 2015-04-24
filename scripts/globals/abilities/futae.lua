-----------------------------------
-- Ability: Futae
-- Grants a bonus to your next elemental ninjutsu by expending two ninja tools.
-- Obtained: Ninja Level 77
-- Recast Time: 3:00
-- Duration: 1:00
-----------------------------------

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
    target:addStatusEffect(EFFECT_FUTAE,0,0,60);
end;