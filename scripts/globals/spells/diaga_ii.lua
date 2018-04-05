-----------------------------------------
-- Spell: Diaga II
-- Lowers an enemy's defense and gradually deals light elemental damage.
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    -- calculate raw damage
    local basedmg = caster:getSkillLevel(ENFEEBLING_MAGIC_SKILL) / 4;
    local params = {};
    params.dmg = basedmg;
    params.multiplier = 3;
    params.skillType = ENFEEBLING_MAGIC_SKILL;
    params.attribute = MOD_INT;
    params.hasMultipleTargetReduction = false;

    local dmg = calculateMagicDamage(caster, target, spell, params);

    dmg = utils.clamp(dmg, 1, 40);

    -- get resist multiplier (1x if no resist)
    local params = {};
    params.diff = caster:getStat(MOD_INT)-target:getStat(MOD_INT);
    params.attribute = MOD_INT;
    params.skillType = ENFEEBLING_MAGIC_SKILL;
    params.bonus = 1.0;
    local resist = applyResistance(caster, target, spell, params);
    -- get the resisted damage
    dmg = dmg*resist;
    -- add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster,spell,target,dmg);
    -- add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement());
    -- add in final adjustments including the actual damage dealt
    local final = finalMagicAdjustments(caster,target,spell,dmg);

    -- Calculate duration and bonus
    local duration = 120;
    local dotBonus = caster:getMod(MOD_DIA_DOT);  -- Dia Wand

    if (caster:hasStatusEffect(dsp.effects.SABOTEUR)) then
        duration = duration * 2;
        caster:delStatusEffect(dsp.effects.SABOTEUR);
    end

    -- Check for Bio.
    local bio = target:getStatusEffect(dsp.effects.BIO);

    -- Do it!
    if (target:addStatusEffect(dsp.effects.DIA,2+dotBonus,3,duration,FLAG_ERASABLE,10,2)) then
        spell:setMsg(msgBasic.MAGIC_DMG);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end

    -- Try to kill same tier Bio
    if (BIO_OVERWRITE == 1 and bio ~= nil) then
        if (bio:getPower() <= 2) then
            target:delStatusEffect(dsp.effects.BIO);
        end
    end

    return final;

end;
