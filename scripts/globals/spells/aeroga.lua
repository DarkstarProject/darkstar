-----------------------------------------
-- Spell: Aeroga
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
    spellParams.V = 96
    spellParams.V0 = 100
    spellParams.V50 = 230
    spellParams.V100 = 320
    spellParams.V200 = 420
    spellParams.M = 1
    spellParams.M0 = 2.6
    spellParams.M50 = 1.8
    spellParams.M100 = 1
    spellParams.M200 = 0
    spellParams.I = 120

    return doElementalNuke(caster, spell, target, spellParams)
end
