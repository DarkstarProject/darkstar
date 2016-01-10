-----------------------------------
-- Ability: Third Eye
-- Anticipates and dodges the next attack directed at you.
-- Obtained: Samurai Level 15
-- Recast Time: 1:00
-- Duration: 0:30
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:hasStatusEffect(EFFECT_SEIGAN)) then
        ability:setRecast(ability:getRecast()/2);
    end
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

