-----------------------------------------
-- Spell: Diaga
-- Lowers an enemy's defense and gradually deals light elemental damage.
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)

    local basedmg = caster:getSkillLevel(dsp.skill.ENFEEBLING_MAGIC) / 4
    local params = {}
    params.dmg = basedmg
    params.multiplier = 1
    params.skillType = dsp.skill.ENFEEBLING_MAGIC
    params.attribute = dsp.mod.INT
    params.hasMultipleTargetReduction = false
    params.diff = caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT)
    params.attribute = dsp.mod.INT
    params.skillType = dsp.skill.ENFEEBLING_MAGIC
    params.bonus = 1.0

    -- calculate raw damage
    local dmg = calculateMagicDamage(caster, target, spell, params)
    -- softcaps at 12, should always do at least 1
    dmg = utils.clamp(dmg, 1, 12)
    -- get resist multiplier (1x if no resist)
    local resist = applyResistance(caster, target, spell, params)
    -- get the resisted damage
    dmg = dmg * resist
    -- add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster, spell, target, dmg)
    -- add in target adjustment
    dmg = adjustForTarget(target, dmg, spell:getElement())
    -- add in final adjustments including the actual damage dealt
    local final = finalMagicAdjustments(caster, target, spell, dmg)

    -- calculate duration and bonus
    local duration = calculateDuration(60, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    local dotBonus = caster:getMod(dsp.mod.DIA_DOT)  -- Dia Wand

    -- check for Bio
    local bio = target:getStatusEffect(dsp.effect.BIO)

    -- do it!
    target:addStatusEffect(dsp.effect.DIA, 1 + dotBonus, 3, duration, 0, 10, 1)
    spell:setMsg(dsp.msg.basic.MAGIC_DMG)

    -- try to kill same tier Bio (non-default behavior)
    if (BIO_OVERWRITE == 1 and bio ~= nil) then
        if (bio:getPower() == 1) then
            target:delStatusEffect(dsp.effect.BIO)
        end
    end

    return final
end