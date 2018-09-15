-----------------------------------------
-- Spell: Flurry
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = calculateDuration(180, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    duration = calculateDurationForLvl(duration, 48, target:getMainLvl())

    if target:addStatusEffect(dsp.effect.FLURRY, 15, 0, duration) then
        spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.FLURRY
end
