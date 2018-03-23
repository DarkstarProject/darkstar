-----------------------------------
-- Ability: Defender
-- Enhances defense but weakens attacks.
-- Obtained: Warrior Level 25
-- Recast Time: 3:00
-- Duration: 3:00
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

function onUseAbility(player,target,ability)
    player:addStatusEffect(EFFECT_DEFENDER,1,0,180);
end;