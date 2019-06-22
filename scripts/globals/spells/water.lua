-----------------------------------------
-- Spell: Water
-- Deals water damage to an enemy.
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
    spellParams.V = 16
    spellParams.V0 = 25
    spellParams.V50 = 115
    spellParams.V100 = 165
    spellParams.V200 = 165
    spellParams.M = 1
    spellParams.M0 = 1.8
    spellParams.M50 = 1
    spellParams.M100 = 0
    spellParams.M200 = 0
    spellParams.I = 25

    return doElementalNuke(caster, spell, target, spellParams)
end
