--------------------------------------
-- Spell: Gain-CHR
--     Boosts CHR for the Caster
--------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
--------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local effect = dsp.effect.CHR_BOOST
    doBoostGain(caster,target,spell,effect)
    return effect
end