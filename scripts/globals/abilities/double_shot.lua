-----------------------------------
-- Ability: Double Shot
-- Occasionally uses two units of ammunition to deal double damage.
-- Obtained: Ranger Level 79
-- Recast Time: 3:00
-- Duration: 1:30
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

    local chance = 40;

    player:addStatusEffect(EFFECT_DOUBLE_SHOT,chance,0,90);
end;