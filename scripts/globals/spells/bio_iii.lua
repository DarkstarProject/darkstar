-----------------------------------------
-- Spell: Bio III
-- Deals dark damage that weakens an enemy's attacks and gradually reduces its HP.
-- caster:getMerit() returns a value which is equal to the number of merit points TIMES the value of each point
-- Bio III value per point is '30' This is a constant set in the table 'merits'
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    --calculate raw damage
    local basedmg = caster:getSkillLevel(DARK_MAGIC_SKILL) / 4;
    local params = {};
    params.dmg = basedmg;
    params.multiplier = 3;
    params.skillType = DARK_MAGIC_SKILL;
    params.attribute = MOD_INT;
    params.hasMultipleTargetReduction = false;

    local dmg = calculateMagicDamage(caster, target, spell, params);

    -- Softcaps at 32, should always do at least 1
    if (dmg > 62) then
        dmg = 62;
    end
    if (dmg < 1) then
        dmg = 1;
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
    --add in final adjustments including the actual damage dealt
    local final = finalMagicAdjustments(caster,target,spell,dmg);

    -- Calculate duration.
    local duration = caster:getMerit(MERIT_BIO_III);
    if (duration == 0) then --if caster has the spell but no merits in it, they are either a mob or we assume they are GM or otherwise gifted with max duration
        duration = 150;
    end

    -- Check for Dia.
    local dia = target:getStatusEffect(dsp.effects.DIA);

    -- Calculate DoT (rough, though fairly accurate)
    local dotdmg = 4 + math.floor(caster:getSkillLevel(DARK_MAGIC_SKILL) / 60);

    -- Do it!
    if (target:addStatusEffect(dsp.effects.BIO,dotdmg,3,duration,FLAG_ERASABLE, 15,3)) then
        spell:setMsg(msgBasic.MAGIC_DMG);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end

    --Try to kill same tier Dia (default behavior)
    if (DIA_OVERWRITE == 1 and dia ~= nil) then
        if (dia:getPower() <= 3) then
            target:delStatusEffect(dsp.effects.DIA);
        end
    end

    return final;

end;
