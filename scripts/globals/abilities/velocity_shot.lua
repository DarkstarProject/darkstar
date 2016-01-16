-----------------------------------
-- Ability: Velocity Shot
-- Increases attack power and speed of ranged attacks, while reducing attack power and speed of melee attacks.
-- Obtained: Ranger Level 45
-- Recast Time: 5:00 minutes
-- Duration: 2 hours
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
    player:addStatusEffect(EFFECT_VELOCITY_SHOT,1,0,7200);
end;