-----------------------------------
-- Ability: Drain Samba
-- Inflicts the next target you strike with Drain daze, allowing all those engaged in battle with it to drain its HP.
-- Obtained: Dancer Level 5
-- TP Required: 10%
-- Recast Time: 1:00
-- Duration: 2:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:hasStatusEffect(dsp.effect.FAN_DANCE)) then
        return dsp.msg.basic.UNABLE_TO_USE_JA2, 0
    elseif (player:hasStatusEffect(dsp.effect.TRANCE)) then
        return 0,0
    elseif (player:getTP() < 100) then
        return dsp.msg.basic.NOT_ENOUGH_TP,0
    else
        return 0,0
    end
end

function onUseAbility(player,target,ability)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(dsp.effect.TRANCE) then
        player:delTP(100)
    end

    local duration = 120 + player:getMod(dsp.mod.SAMBA_DURATION)
    duration = duration * (100 + player:getMod(dsp.mod.SAMBA_PDURATION))/100
    player:delStatusEffect(dsp.effect.HASTE_SAMBA)
    player:delStatusEffect(dsp.effect.ASPIR_SAMBA)
    player:addStatusEffect(dsp.effect.DRAIN_SAMBA,1,0,duration)
end
