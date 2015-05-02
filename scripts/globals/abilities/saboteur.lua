-----------------------------------
-- Ability: Saboteur
-- If the next spell you cast is enfeebling magic, its effect and duration will be enhanced.
-- Obtained: Red Mage Level 83
-- Recast Time: 5:00
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
    player:addStatusEffect(EFFECT_SABOTEUR,0,0,60);
end;