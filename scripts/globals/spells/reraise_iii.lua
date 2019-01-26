-----------------------------------------
-- Spell: Reraise 3
-----------------------------------------

require("scripts/globals/status")

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    --duration = 1800
    target:delStatusEffect(dsp.effect.RERAISE)
    target:addStatusEffect(dsp.effect.RERAISE,3,0,3600) --reraise 3, 30min duration

    return dsp.effect.RERAISE
end
