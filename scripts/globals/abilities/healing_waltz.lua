-----------------------------------
-- Ability: Healing Waltz
-- Removes one detrimental status effect from target party member.
-- Obtained: Dancer Level 35
-- TP Required: 20%
-- Recast Time: 00:15
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (target:getHP() == 0) then
        return dsp.msg.basic.CANNOT_ON_THAT_TARG,0
    elseif (player:hasStatusEffect(dsp.effect.SABER_DANCE)) then
        return dsp.msg.basic.UNABLE_TO_USE_JA2, 0
    elseif (player:hasStatusEffect(dsp.effect.TRANCE)) then
        return 0,0
    elseif (player:getTP() < 200) then
        return dsp.msg.basic.NOT_ENOUGH_TP,0
    else
        --[[ Apply "Waltz Ability Delay" reduction
            1 modifier = 1 second]]
        local recastMod = player:getMod(dsp.mod.WALTZ_DELAY)
        if (recastMod ~= 0) then
            local newRecast = ability:getRecast() +recastMod
            ability:setRecast(utils.clamp(newRecast,0,newRecast))
        end
        -- Apply "Fan Dance" Waltz recast reduction
        if (player:hasStatusEffect(dsp.effect.FAN_DANCE)) then
            local fanDanceMerits = target:getMerit(dsp.merit.FAN_DANCE)
            -- Every tier beyond the 1st is -5% recast time
            if (fanDanceMerits > 5) then
                ability:setRecast(ability:getRecast() * ((fanDanceMerits -5)/100))
            end
        end
        return 0,0
    end
end

function onUseAbility(player,target,ability)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(dsp.effect.TRANCE) then
        player:delTP(200)
    end

    local effect = target:healingWaltz()

    if (effect == dsp.effect.NONE) then
        ability:setMsg(dsp.msg.basic.NO_EFFECT) -- no effect
    else
        ability:setMsg(dsp.msg.basic.JA_REMOVE_EFFECT)
    end

    return effect
end
