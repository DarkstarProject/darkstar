-----------------------------------------
-- Spell: Refresh
-- Gradually restores target party member's MP
-- Composure increases duration 3x
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
    duration = calculateDurationForLvl(duration, 41, target:getMainLvl())

    local mp = 3 + caster:getMod(dsp.mod.ENHANCES_REFRESH)

    if target:hasStatusEffect(dsp.effect.SUBLIMATION_ACTIVATED) or target:hasStatusEffect(dsp.effect.SUBLIMATION_COMPLETE) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        return 0
    end

    target:delStatusEffect(dsp.effect.REFRESH)
    target:addStatusEffect(dsp.effect.REFRESH, mp, 0, duration)

    return dsp.effect.REFRESH
end
