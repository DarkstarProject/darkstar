-----------------------------------
-- Ability: Spontaneity
-- Reduces casting time for the next magic spell the target casts.
-- Obtained: Red Mage Level 95
-- Recast Time: 10:00
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
    target:addStatusEffect(EFFECT_SPONTANEITY,1,0,60);
end;