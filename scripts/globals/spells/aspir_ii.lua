-----------------------------------------
-- Spell: Aspir
-- Drain functions only on skill level!!
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local dmg = 10 + 0.575 * caster:getSkillLevel(dsp.skill.DARK_MAGIC)
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
    --add in final adjustments

    if (dmg < 0) then
        dmg = 0
    end

    dmg = dmg * DARK_POWER

    if (target:isUndead()) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT) -- No effect
        return dmg
    end

    if (target:getMP() > dmg) then
        caster:addMP(dmg)
        target:delMP(dmg)
    else
        dmg = target:getMP()
        caster:addMP(dmg)
        target:delMP(dmg)
    end

    return dmg
end
