-----------------------------------
-- Ability: Drain Samba II
-- Inflicts the next target you strike with Drain Daze, allowing all those engaged in battle with it to drain its HP.
-- Obtained: Dancer Level 35
-- TP Required: 25%
-- Recast Time: 1:00
-- Duration: 1:30
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:hasStatusEffect(EFFECT.FAN_DANCE)) then
        return msgBasic.UNABLE_TO_USE_JA2, 0;
    elseif (player:hasStatusEffect(EFFECT.TRANCE)) then
        return 0,0;
    elseif (player:getTP() < 250) then
        return msgBasic.NOT_ENOUGH_TP,0;
    else
        return 0,0;
    end;
end;

function onUseAbility(player,target,ability)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(EFFECT.TRANCE) then
        player:delTP(250);
    end;

    local duration = 120 + player:getMod(MOD_SAMBA_DURATION);
    duration = duration * (100 + player:getMod(MOD_SAMBA_PDURATION))/100;
    player:delStatusEffect(EFFECT.HASTE_SAMBA);
    player:delStatusEffect(EFFECT.ASPIR_SAMBA);
    player:addStatusEffect(EFFECT.DRAIN_SAMBA,2,0,duration);
end;
