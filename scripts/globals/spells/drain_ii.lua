-----------------------------------------
-- Spell: Drain II
-- Drain functions only on skill level!!
-----------------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    --calculate raw damage (unknown function  -> only dark skill though) - using http://www.bluegartr.com/threads/44518-Drain-Calculations
    -- also have small constant to account for 0 dark skill
    local dmg = 20 + (1.236 * caster:getSkillLevel(DARK_MAGIC_SKILL));

    if (dmg > (caster:getSkillLevel(DARK_MAGIC_SKILL) + 85)) then
        dmg = (caster:getSkillLevel(DARK_MAGIC_SKILL) + 85);
    end

    --get resist multiplier (1x if no resist)
    local params = {};
    params.diff = caster:getStat(MOD_INT)-target:getStat(MOD_INT);
    params.attribute = MOD_INT;
    params.skillType = DARK_MAGIC_SKILL;
    params.bonus = 1.0;
    local resist = applyResistance(caster, target, spell, params);
    --get the resisted damage
    dmg = dmg*resist;
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster,spell,target,dmg);
    --add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement());
    --add in final adjustments

    if (dmg < 0) then
        dmg = 0
    end

    if (target:getHP() < dmg) then
        dmg = target:getHP();
    end

    if (target:isUndead()) then
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- No effect
        return dmg;
    end

    dmg = finalMagicAdjustments(caster,target,spell,dmg);

    local leftOver = (caster:getHP() + dmg) - caster:getMaxHP();

    if (leftOver > 0) then
        caster:addStatusEffect(dsp.effects.MAX_HP_BOOST, (leftOver/caster:getMaxHP())*100, 0, 60);
    end

    caster:addHP(dmg);
    spell:setMsg(msgBasic.MAGIC_DRAIN_HP); --change msg to 'xxx hp drained from the yyyy.'
    return dmg;
end;
