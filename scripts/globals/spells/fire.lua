-----------------------------------------
-- Spell: Fire
-- Deals fire damage to an enemy.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local spellParams = {}
    spellParams.hasMultipleTargetReduction = false
    spellParams.resistBonus = 1.0
    spellParams.V = 35
    spellParams.V0 = 55
    spellParams.V50 = 125
    spellParams.V100 = 175
    spellParams.V200 = 175
    spellParams.M = 1
    spellParams.M0 = 1.4
    spellParams.M50 = 1
    spellParams.M100 = 0
    spellParams.M200 = 0
    spellParams.I = 46

    return doElementalNuke(caster, spell, target, spellParams)
end
