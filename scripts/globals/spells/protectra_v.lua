-----------------------------------------
-- Spell: Protectra V
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = calculateDuration(1800, spell:getSkillType(), spell:getSpellGroup(), caster, target, false)
    duration = calculateDurationForLvl(duration, 75, target:getMainLvl())

    local meritBonus = caster:getMerit(dsp.merit.PROTECTRA_V)
    local power = 175 + meritBonus
    if (meritBonus > 0) then -- certain mobs can cast this spell, so don't apply the -5 for having 0 merits.
        power = power + meritBonus - 5
    end
    --printf("Protectra V Power: %d", power)    

    local typeEffect = dsp.effect.PROTECT
    if target:addStatusEffect(typeEffect, power, 0, duration) then
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end

    return typeEffect
end
