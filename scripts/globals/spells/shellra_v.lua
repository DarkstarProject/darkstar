-----------------------------------------
-- Spell: Shellra
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local meritBonus = caster:getMerit(dsp.merit.SHELLRA_V)
    local power = 29 -- according to bg-wiki

    local duration = calculateDuration(1800, spell:getSkillType(), spell:getSpellGroup(), caster, target, false)
    duration = calculateDurationForLvl(duration, 75, target:getMainLvl())

    local typeEffect = dsp.effect.SHELL
    if (target:addStatusEffect(typeEffect, power, 0, duration)) then
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end
    return typeEffect
end
