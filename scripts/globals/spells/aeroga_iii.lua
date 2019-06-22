-----------------------------------------
-- Spell: Aeroga III
-- Deals wind damage to enemies within area of effect.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local spellParams = {}
    spellParams.hasMultipleTargetReduction = true
    spellParams.resistBonus = 1.0
    spellParams.V = 527
    spellParams.V0 = 580
    spellParams.V50 = 800
    spellParams.V100 = 990
    spellParams.V200 = 1280
    spellParams.M = 1.5
    spellParams.M0 = 4.4
    spellParams.M50 = 3.8
    spellParams.M100 = 2.9
    spellParams.M200 = 2
    spellParams.I = 642

    return doElementalNuke(caster, spell, target, spellParams)
end
