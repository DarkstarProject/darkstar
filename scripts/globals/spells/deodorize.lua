-----------------------------------------
-- Spell: Deodorize
-- Lessens chance of being detected by smell.
-- Duration is random number between 30 seconds and 5 minutes
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
    if not target:hasStatusEffect(dsp.effect.DEODORIZE) then
        local duration = calculateDuration(math.random(420, 540), spell:getSkillType(), spell:getSpellGroup(), caster, target)
        duration = calculateDurationForLvl(duration, 15, target:getMainLvl())

        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)
        target:addStatusEffect(dsp.effect.DEODORIZE, 0, 10, math.floor(duration * SNEAK_INVIS_DURATION_MULTIPLIER))
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.DEODORIZE
end
