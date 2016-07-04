-----------------------------------
-- Ability: Sneak Attack
-- Deals critical damage when striking from behind.
-- Obtained: Thief Level 15
-- Recast Time: 1:00
-- Duration: 1:00
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
   player:addStatusEffect(EFFECT_SNEAK_ATTACK,1,0,60);
end;