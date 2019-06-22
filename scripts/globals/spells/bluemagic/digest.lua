-----------------------------------------
-- Spell: Digest
-- Steals an enemy's HP. Ineffective against undead
-- Spell cost: 20 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 2
-- Stat Bonus: HP-5, MP+5
-- Level: 36
-- Casting Time: 4 seconds
-- Recast Time: 90 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: None
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)

    local dmg = 5 + 0.575 * caster:getSkillLevel(dsp.skill.BLUE_MAGIC)
    --get resist multiplier (1x if no resist)
    local params = {}
    params.diff = caster:getStat(dsp.mod.MND)-target:getStat(dsp.mod.MND)
    params.attribute = dsp.mod.MND
    params.skillType = dsp.skill.BLUE_MAGIC
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

    if (target:isUndead()) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        return dmg
    end

    if (target:getHP() < dmg) then
        dmg = target:getHP()
    end

    dmg = BlueFinalAdjustments(caster,target,spell,dmg,params)
    caster:addHP(dmg)

    return dmg
end
