-----------------------------------
-- Ability: Elemental Seal
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
    local power = player:getMerit(MERIT_FEALTY);

    player:addStatusEffect(EFFECT_FEALTY,power,0,60 + (power * 5));
end;
