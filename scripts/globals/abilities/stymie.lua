-----------------------------------
-- Ability: Stymie
-- Greatly increases the accuracy of the next enfeebling magic spell.
-- Obtained: Red Mage Level 96
-- Recast Time: 1:00:00
-- Duration: Stymie fades after either sixty seconds passes or a spell lands, but it does not fade if the spell is resisted.
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
    target:addStatusEffect(EFFECT_STYMIE,0,0,60);
end;