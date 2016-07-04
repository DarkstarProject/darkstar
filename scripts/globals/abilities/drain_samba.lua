-----------------------------------
-- Ability: Drain Samba
-- Inflicts the next target you strike with Drain daze, allowing all those engaged in battle with it to drain its HP.
-- Obtained: Dancer Level 5
-- TP Required: 10%
-- Recast Time: 1:00
-- Duration: 2:00
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAbilityCheck
-----------------------------------
 
function onAbilityCheck(player,target,ability)
    if (player:hasStatusEffect(EFFECT_FAN_DANCE)) then
        return MSGBASIC_UNABLE_TO_USE_JA2, 0;
    elseif (player:hasStatusEffect(EFFECT_TRANCE)) then
        return 0,0;
    elseif (player:getTP() < 100) then
        return MSGBASIC_NOT_ENOUGH_TP,0;
    else
        return 0,0;
    end;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(EFFECT_TRANCE) then
        player:delTP(100);
    end;

    local duration = 120 + player:getMod(MOD_SAMBA_DURATION);
    duration = duration * (100 + player:getMod(MOD_SAMBA_PDURATION))/100;
    player:delStatusEffect(EFFECT_HASTE_SAMBA);
    player:delStatusEffect(EFFECT_ASPIR_SAMBA);
    player:addStatusEffect(EFFECT_DRAIN_SAMBA,1,0,duration);
end;
