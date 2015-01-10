-----------------------------------
-- Ability: Assassin's Charge
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
    local merits = player:getMerit(MERIT_ASSASSINS_CHARGE);
    player:addStatusEffect(EFFECT_ASSASSIN_S_CHARGE,merits-5,0,60);
end;
