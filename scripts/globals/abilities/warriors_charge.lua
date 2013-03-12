-----------------------------------
-- Ability: Assassin's Charge
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
    local merits = player:getMerit(MERIT_WARRIORS_CHARGE);
    player:addStatusEffect(EFFECT_ASSASSIN_S_CHARGE,merits,0,60);
end;
