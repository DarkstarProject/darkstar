-----------------------------------------
-- Spell: Enwater
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local effect = dsp.effect.ENWATER
    doEnspell(caster,target,spell,effect)
    return effect
end