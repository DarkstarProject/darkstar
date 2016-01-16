-----------------------------------
-- Ability: Hundred Fists
-- Speeds up attacks.
-- Obtained: Monk Level 1
-- Recast Time: 1:00:00
-- Duration: 0:00:45
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
    player:addStatusEffect(EFFECT_HUNDRED_FISTS,1,0,45);
end;