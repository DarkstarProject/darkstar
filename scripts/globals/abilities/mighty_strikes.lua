-----------------------------------
-- Ability: Mighty Strikes
-- Turns all melee attacks into critical hits.
-- Obtained: Warrior Level 1
-- Recast Time: 1:00:00
-- Duration: 0:00:45
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
    player:addStatusEffect(EFFECT_MIGHTY_STRIKES,1,0,45);
end;