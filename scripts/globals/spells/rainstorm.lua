--------------------------------------
-- Spell: Rainstorm
--     Changes the weather around target party member to "rainy."
--------------------------------------
require("scripts/globals/magic")
require("scripts/globals/settings")
require("scripts/globals/status")
--------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)

    target:delStatusEffectSilent(dsp.effect.FIRESTORM)
    target:delStatusEffectSilent(dsp.effect.SANDSTORM)
    target:delStatusEffectSilent(dsp.effect.RAINSTORM)
    target:delStatusEffectSilent(dsp.effect.WINDSTORM)
    target:delStatusEffectSilent(dsp.effect.HAILSTORM)
    target:delStatusEffectSilent(dsp.effect.THUNDERSTORM)
    target:delStatusEffectSilent(dsp.effect.AURORASTORM)
    target:delStatusEffectSilent(dsp.effect.VOIDSTORM)

    local duration = calculateDuration(180, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    duration = calculateDurationForLvl(duration, 42, target:getMainLvl())

    local merit = caster:getMerit(dsp.merit.STORMSURGE)
    local power = 0
    if merit > 0 then
        power = merit + caster:getMod(dsp.mod.STORMSURGE_EFFECT) + 2
    end

    target:addStatusEffect(dsp.effect.RAINSTORM, power, 0, duration)

    return dsp.effect.RAINSTORM
end