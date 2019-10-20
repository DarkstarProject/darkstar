-----------------------------------
-- Ability: Modus Veritas
-- Increases damage done by helix spells while lowering spell duration by 50%.
-- Obtained: Scholar Level 65
-- Recast Time: 3:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local helix = target:getStatusEffect(dsp.effect.HELIX)
    if helix ~= nil then
        local mvPower = helix:getSubPower()
        local resist = applyResistanceAbility(player, target, dsp.magic.ele.NONE, dsp.skill.ELEMENTAL_MAGIC, 0) -- seems reasonable...
        -- Doesn't work against NMs apparently
        if mvPower > 0 or resist < 0.25 or target:isNM() then -- Don't let Modus Veritas stack to prevent abuse
            ability:setMsg(dsp.msg.basic.JA_MISS) --Miss
            return 0
        else
            -- Double power and halve remaining time
            local mvMerits = player:getMerit(dsp.merit.MODUS_VERITAS_DURATION)
            local durationMultiplier = 0.5 + (0.05 * mvMerits)
            mvPower = mvPower + 1
            local helixPower = helix:getPower() * 2
            local duration = helix:getDuration()
            local remaining = math.floor(helix:getTimeRemaining() / 1000) -- from milliseconds
            -- print(string.format("helix original dot stats: %i, duration: %i, remaining: %i", helixPower / 2, duration, remaining))
            duration = (duration-remaining) + math.floor(remaining * durationMultiplier)
            -- print(string.format("helix new dot stats: %i, remaining: %i", helixPower, duration))
            helix:setSubPower(mvPower)
            helix:setPower(helixPower)
            helix:setDuration(duration * 1000) -- back to milliseconds
        end
    else
        ability:setMsg(dsp.msg.basic.JA_NO_EFFECT_2) -- No effect
    end
end
