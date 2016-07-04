-----------------------------------
-- Ability: Afflatus Solace
-- Inspires you to draw strength from the healing spells you cast.
-- Obtained: White Mage Level 40
-- Recast Time: 1:00
-- Duration: 2 hours
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
    target:delStatusEffect(EFFECT_AFFLATUS_SOLACE);
    target:delStatusEffect(EFFECT_AFFLATUS_MISERY);
    target:addStatusEffect(EFFECT_AFFLATUS_SOLACE,8,0,7200);
end;