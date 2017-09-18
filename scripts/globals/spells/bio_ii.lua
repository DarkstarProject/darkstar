-----------------------------------------
-- Spell: Bio II
-- Deals dark damage that weakens an enemy's attacks and gradually reduces its HP.
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
    params.multiplier = 2;
    params.skillType = DARK_MAGIC_SKILL;
    params.attribute = MOD_INT;
    params.hasMultipleTargetReduction = false;

    local dmg = calculateMagicDamage(caster, target, spell, params);

    -- Softcaps at 8, should always do at least 1
    if (dmg > 30) then
        dmg = 30;
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
    resist = applyResistance(caster, target, spell, params);
    --get the resisted damage
    dmg = dmg*resist;
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster,spell,target,dmg);
    --add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement());
    --add in final adjustments including the actual damage dealt
    local final = finalMagicAdjustments(caster,target,spell,dmg);

    -- Calculate duration.
    local duration = 120;

    -- Check for Dia.
    local dia = target:getStatusEffect(EFFECT_DIA);

    -- Calculate DoT (rough, though fairly accurate)
    local dotdmg = 3 + math.floor(caster:getSkillLevel(DARK_MAGIC_SKILL) / 60);

    -- Do it!
    if (dia == nil or (BIO_OVERWRITE == 0 and dia:getPower() <= 2) or (BIO_OVERWRITE == 1 and dia:getPower() < 2)) then
        target:delStatusEffect(EFFECT_BIO); -- delete old bio
        target:addStatusEffect(EFFECT_BIO,dotdmg,3,duration,FLAG_ERASABLE, 10);
    end

    --Try to kill same tier Dia (default behavior)
    if (DIA_OVERWRITE == 1 and dia ~= nil) then
        if (dia:getPower() <= 2) then
            target:delStatusEffect(EFFECT_DIA);
        end
    end

    return final;

end;
