-----------------------------------------
--
-- Spell: Temper
--
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local effect = dsp.effect.MULTI_STRIKES
    local enhskill = caster:getSkillLevel(dsp.skill.ENHANCING_MAGIC)
    local duration = calculateDuration(180, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    duration = calculateDurationForLvl(duration, 95, target:getMainLvl())

    local power = 5
    if enhskill >= 360 then
        power = math.floor((enhskill - 300) / 10)
    else
        print("Warning: Unknown enhancing magic skill for Temper.")
    end

    -- TODO: Investigate rumor that Temper is no longer hard capped at 500 skill
    power = math.min(power, 20)

    if target:addStatusEffect(effect, power, 0, duration) then
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return effect
end
