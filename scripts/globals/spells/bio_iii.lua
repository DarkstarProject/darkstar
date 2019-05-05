-----------------------------------------
-- Spell: Bio III
-- Deals dark damage that weakens an enemy's attacks and gradually reduces it's HP.
-- caster:getMerit() returns a value which is equal to the number of merit points TIMES the value of each point
-- Bio III value per point is '30' This is a constant set in the table 'merits'
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
--------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)

    local basedmg = caster:getSkillLevel(dsp.skill.DARK_MAGIC) / 4
    local params = {}
    params.dmg = basedmg
    params.multiplier = 3
    params.skillType = dsp.skill.DARK_MAGIC
    params.attribute = dsp.mod.INT
    params.hasMultipleTargetReduction = false
    params.diff = caster:getStat(dsp.mod.INT)-target:getStat(dsp.mod.INT)
    params.attribute = dsp.mod.INT
    params.skillType = dsp.skill.DARK_MAGIC
    params.bonus = 1.0

    -- calculate raw damage
    local dmg = calculateMagicDamage(caster, target, spell, params)
    -- softcaps at 62, should always do at least 1
    dmg = utils.clamp(dmg, 1, 62)
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

    -- calculate duration
    local duration = caster:getMerit(dsp.merit.BIO_III)
    if duration == 0 then --if caster has the spell but no merits in it, they are either a mob or we assume they are GM or otherwise gifted with max duration
        duration = 150
    end

    -- check for Dia
    local dia = target:getStatusEffect(dsp.effect.DIA)

    -- calculate DoT effect (rough, though fairly accurate)
    local dotdmg = 4 + math.floor(caster:getSkillLevel(dsp.skill.DARK_MAGIC) / 60)

    -- do it!
    target:addStatusEffect(dsp.effect.BIO, dotdmg, 3, duration, 0, 20, 3)
    spell:setMsg(dsp.msg.basic.MAGIC_DMG)

    -- try to kill same tier Dia (default behavior)
    if DIA_OVERWRITE == 1 and dia ~= nil then
        if dia:getPower() <= 3 then
            target:delStatusEffect(dsp.effect.DIA)
        end
    end

    return final
end
