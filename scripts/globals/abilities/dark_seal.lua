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
    local merits = player:getMerit(MERIT_DARK_SEAL);
    player:addStatusEffect(EFFECT_DARK_SEAL,merits,0,60);
end;
