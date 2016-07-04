-----------------------------------
-- Ability: Manafont
-- Eliminates the cost of magic spells.
-- Obtained: Black Mage Level 1
-- Recast Time: 1:00:00
-- Duration: 0:01:00
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
    player:addStatusEffect(EFFECT_MANAFONT,1,0,60);
end;