-----------------------------------------
-- Spell: Flurry II
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = calculateDuration(150, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    duration = calculateDurationForLvl(duration, 96, target:getMainLvl())
    
    if target:addStatusEffect(dsp.effect.FLURRY_II, 30, 0, duration) then
        spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.FLURRY_II
end
