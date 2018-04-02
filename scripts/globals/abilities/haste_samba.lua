-----------------------------------
-- Ability: Haste Samba
-- Inflicts the next target you strike with Haste daze, increasing the attack speed of all those engaged in battle with it.
-- Obtained: Dancer Level 45
-- TP Cost: 35%
-- Recast Time: 1:00
-- Duration: 1:30
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:hasStatusEffect(dsp.effects.FAN_DANCE)) then
        return msgBasic.UNABLE_TO_USE_JA2, 0;
    elseif (player:hasStatusEffect(dsp.effects.TRANCE)) then
        return 0,0;
    elseif (player:getTP() < 350) then
        return msgBasic.NOT_ENOUGH_TP,0;
    else
        return 0,0;
    end;
end;

function onUseAbility(player,target,ability)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(dsp.effects.TRANCE) then
        player:delTP(350);
    end;

    local duration = 120 + player:getMod(MOD_SAMBA_DURATION);
    duration = duration * (100 + player:getMod(MOD_SAMBA_PDURATION))/100;
    player:delStatusEffect(dsp.effects.DRAIN_SAMBA);
    player:delStatusEffect(dsp.effects.ASPIR_SAMBA);
    player:addStatusEffect(dsp.effects.HASTE_SAMBA,player:getMerit(MERIT_HASTE_SAMBA_EFFECT)+52,0,duration);
end;
