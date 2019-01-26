-----------------------------------------
-- Spell: Reprisal
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = calculateDuration(60, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    local maxReflectedDamage = target:getMaxHP() * 2
    local reflectedPercent = 33
    local typeEffect = dsp.effect.REPRISAL

    if target:addStatusEffect(typeEffect, reflectedPercent, 0, duration, 0, maxReflectedDamage) then
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return typeEffect
end
