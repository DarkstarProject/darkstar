-----------------------------------
-- Ability: Rampart
-- Grants a Magic Shield effect and enhances defense for party members within area of effect.
-- Obtained: Paladin Level 62
-- Recast Time: 5:00
-- Duration: 0:30
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

function onUseAbility(player,target,ability)
    local duration = 30 + player:getMod(MOD_RAMPART_DURATION);
    target:addStatusEffect(EFFECT_MAGIC_SHIELD, 1, 0, duration);
end;
