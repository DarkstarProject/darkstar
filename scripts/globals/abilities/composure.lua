-----------------------------------
-- Ability: Composure
-- Increases accuracy and lengthens recast time. Enhancement effects gained through white and black magic you cast on yourself last longer.
-- Obtained: Red Mage Level 50
-- Recast Time: 5:00
-- Duration: 120 minutes
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
    player:delStatusEffect(EFFECT_COMPOSURE);
    player:addStatusEffect(EFFECT_COMPOSURE,1,0,7200);
end;