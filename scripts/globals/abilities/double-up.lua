-----------------------------------
-- Ability: Double Up
-- Enhances an active Phantom Roll effect that is eligible for Double-Up.
-- Obtained: Corsair Level 5
-- Recast Time: 8 seconds
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    ability:setRange(ability:getRange() + player:getMod(MOD_ROLL_RANGE));
    if (not player:hasStatusEffect(EFFECT_DOUBLE_UP_CHANCE)) then
        return MSGBASIC_NO_ELIGIBLE_ROLL,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
end;