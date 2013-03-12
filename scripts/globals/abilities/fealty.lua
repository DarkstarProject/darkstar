-----------------------------------
-- Ability: Elemental Seal
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
    local power = player:getMerit(MERIT_FEALTY);

    player:addStatusEffect(EFFECT_FEALTY,power,0,60);
end;
