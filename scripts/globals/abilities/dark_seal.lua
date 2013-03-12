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
    -- local merits = player:getMerit(MERIT_DIABOLIC_EYE);
    -- player:addStatusEffect(EFFECT_,1,0,60);
end;
