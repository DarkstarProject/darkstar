-----------------------------------
-- Ability: Elemental Seal
-- Enhances the accuracy of the user's next spell
-- Obtained: Black Mage Level 15
-- Recast Time: 10:00
-- Duration: 1 Spell or 60 seconds, whichever occurs first.
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
    player:addStatusEffect(EFFECT_ELEMENTAL_SEAL,1,0,60);
end;