-----------------------------------------
-- Spell: Bio IV
-- Deals dark damage that weakens an enemy's attacks and gradually reduces its HP.
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
--------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)

    --calculate raw damage
    local basedmg = caster:getSkillLevel(dsp.skill.DARK_MAGIC) / 4
    local params = {}
    params.dmg = basedmg
    params.multiplier = 3
    params.skillType = dsp.skill.DARK_MAGIC
    params.attribute = dsp.mod.INT
    params.hasMultipleTargetReduction = false

    local dmg = calculateMagicDamage(caster, target, spell, params)

    -- Softcaps at 32, should always do at least 1
    if (dmg > 80) then
        dmg = 80
    end
    if (dmg < 1) then
        dmg = 1
    end

    --get resist multiplier (1x if no resist)
    local params = {}
    params.diff = caster:getStat(dsp.mod.INT)-target:getStat(dsp.mod.INT)
    params.attribute = dsp.mod.INT
    params.skillType = dsp.skill.DARK_MAGIC
    params.bonus = 1.0
    local resist = applyResistance(caster, target, spell, params)
    --get the resisted damage
    dmg = dmg*resist
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster,spell,target,dmg)
    --add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement())
    --add in final adjustments including the actual damage dealt
    local final = finalMagicAdjustments(caster,target,spell,dmg)

    -- Calculate duration.

    local duration = 180

    -- Check for Dia.
    local dia = target:getStatusEffect(dsp.effect.DIA)

    -- Calculate DoT (rough, though fairly accurate)
    local dotdmg = 5 + math.floor(caster:getSkillLevel(dsp.skill.DARK_MAGIC) / 60)

    -- Do it!
    if (target:addStatusEffect(dsp.effect.BIO,dotdmg,3,duration,0, 20,4)) then
        spell:setMsg(dsp.msg.basic.MAGIC_DMG)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    --Try to kill same tier Dia (default behavior)
    if (DIA_OVERWRITE == 1 and dia ~= nil) then
        if (dia:getPower() <= 4) then
            target:delStatusEffect(dsp.effect.DIA)
        end
    end

    return final

end
