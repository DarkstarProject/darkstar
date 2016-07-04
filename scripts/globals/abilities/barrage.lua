-----------------------------------
-- Ability: Barrage
-- Fires multiple shots at once.
-- Obtained: Ranger Level 30
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
    player:addStatusEffect(EFFECT_BARRAGE,0,0,60);
end;