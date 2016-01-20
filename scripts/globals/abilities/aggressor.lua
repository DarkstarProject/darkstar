-----------------------------------
-- Ability: Aggressor
-- Enhances accuracy but impairs evasion.
-- Obtained: Warrior Level 45
-- Recast Time: 5:00
-- Duration: 3:00
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
    local merits = player:getMerit(MERIT_AGGRESSIVE_AIM);
    player:addStatusEffect(EFFECT_AGGRESSOR,merits,0,180);
end;