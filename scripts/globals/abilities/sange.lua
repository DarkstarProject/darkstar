-----------------------------------
-- Ability: Unlimited Shot
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
    return 0,0;
end;

function OnUseAbility(player, target, ability)
    local potency = player:getMerit(MERIT_SANGE)-1;

    player:addStatusEffect(EFFECT_SANGE,potency * 25,0,60);
end;
