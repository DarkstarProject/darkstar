-----------------------------------------
-- Spell: Ice Spikes
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = calculateDuration(SPIKE_EFFECT_DURATION, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    local typeEffect = dsp.effect.ICE_SPIKES

    local int = caster:getStat(dsp.mod.INT)
    local magicAtk = caster:getMod(dsp.mod.MATT)
    local power = ((int + 10) / 20 + 2) * (1 + magicAtk / 100)

    if target:addStatusEffect(typeEffect, power, 0, duration) then
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

   return typeEffect
end
