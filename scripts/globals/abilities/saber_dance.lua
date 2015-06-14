-----------------------------------
-- Ability: Saber Dance
-- Increases Double Attack rate but renders Waltz unusable. Double Attack rate gradually decreases.
-- Obtained: Dancer Level 75 Merit Group 2
-- Recast Time: 3 minutes
-- Duration: 5 minutes
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
    player:addStatusEffect(EFFECT_SABER_DANCE,50,3,300);
end;