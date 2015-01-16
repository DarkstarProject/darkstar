-----------------------------------
-- Ability: Unlimited Shot
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

function onUseAbility(player, target, ability)
    local potency = player:getMerit(MERIT_SANGE)-1;

    player:addStatusEffect(EFFECT_SANGE,potency * 25,0,60);
end;
