-----------------------------------------
-- Spell: Dread Spikes
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = calculateDuration(SPIKE_EFFECT_DURATION, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    local typeEffect = dsp.effect.DREAD_SPIKES
    local drainAmount = target:getMaxHP() / 2

    if target:addStatusEffect(typeEffect, 0, 0, duration, 0, drainAmount, 1) then
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return typeEffect
end
