-----------------------------------
-- Ability: Sharpshot
-- Increases ranged accuracy.
-- Obtained: Ranger Level 1
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
    local power = 40 + player:getMod(MOD_SHARPSHOT);
    player:addStatusEffect(EFFECT_SHARPSHOT,power,0,60);
end;