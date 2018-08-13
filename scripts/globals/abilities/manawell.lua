-----------------------------------
-- Ability: Manawell
-- Eliminates the cost of next magic spell for self or others in party, not alliance or others.
-- Does not stack with the effects of Spontaneity
-- Obtained: Black Mage Level 95
-- Recast Time: 0:10:00
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
    target:addStatusEffect(dsp.effect.MANAWELL,1,0,60);
end;
