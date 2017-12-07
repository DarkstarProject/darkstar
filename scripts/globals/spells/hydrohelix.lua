--------------------------------------
--     Spell: Hydrohelix
--     Deals water damage that gradually reduces
--  a target's HP. Damage dealt is greatly affected by the weather.
--------------------------------------
 
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
    -- get helix acc/att merits
    local merit = caster:getMerit(MERIT_HELIX_MAGIC_ACC_ATT);

    -- calculate raw damage
    local params = {};
    params.dmg = 35;
    params.multiplier = 1;
    params.skillType = ELEMENTAL_MAGIC_SKILL;
    params.attribute = MOD_INT;
    params.hasMultipleTargetReduction = false;

    local dmg = calculateMagicDamage(caster, target, spell, params);
    dmg = dmg + caster:getMod(MOD_HELIX_EFFECT);
    -- get resist multiplier (1x if no resist)
    local params = {};
    params.diff = caster:getStat(MOD_INT)-target:getStat(MOD_INT);
    params.attribute = MOD_INT;
    params.skillType = ELEMENTAL_MAGIC_SKILL;
    params.bonus = merit*3;
    local resist = applyResistance(caster, target, spell, params);
    -- get the resisted damage
    dmg = dmg*resist;
    -- add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster,spell,target,dmg,merit*2);
    -- add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement());
    local dot = dmg;
    -- add in final adjustments
    dmg = finalMagicAdjustments(caster,target,spell,dmg);
    -- calculate Damage over time
    dot = target:magicDmgTaken(dot);

    local duration = getHelixDuration(caster) + caster:getMod(MOD_HELIX_DURATION);

    duration = duration * (resist/2);

    if (dot > 0) then
        target:addStatusEffect(EFFECT_HELIX,dot,3,duration);
    end;

    return dmg;
end;