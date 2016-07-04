-----------------------------------------
-- Spell: Dia III
-- Lowers an enemy's defense and gradually deals light elemental damage.
-- caster:getMerit() returns a value which is equal to the number of merit points TIMES the value of each point
-- Dia III value per point is '30' This is a constant set in the table 'merits'
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
    local basedmg = caster:getSkillLevel(ENFEEBLING_MAGIC_SKILL) / 4;
    local dmg = calculateMagicDamage(basedmg,5,caster,spell,target,ENFEEBLING_MAGIC_SKILL,MOD_INT,false);

    -- Softcaps at 32, should always do at least 1

    dmg = utils.clamp(dmg, 1, 32);

    --get resist multiplier (1x if no resist)
    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT)-target:getStat(MOD_INT),ENFEEBLING_MAGIC_SKILL,1.0);
    --get the resisted damage
    dmg = dmg*resist;
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster,spell,target,dmg);
    --add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement());
    --add in final adjustments including the actual damage dealt
    local final = finalMagicAdjustments(caster,target,spell,dmg);

    -- Calculate duration.
    local duration = caster:getMerit(MERIT_DIA_III);
    local dotBonus = 0;
    
    if (duration == 0) then --if caster has the spell but no merits in it, they are either a mob or we assume they are GM or otherwise gifted with max duration
        duration = 150;
    end

    if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
        duration = duration * 2;
    end
    caster:delStatusEffect(EFFECT_SABOTEUR);
    
    dotBonus = dotBonus+caster:getMod(MOD_DIA_DOT);  -- Dia Wand

    -- Check for Bio.
    local bio = target:getStatusEffect(EFFECT_BIO);

    -- Do it!
    if (bio == nil or (DIA_OVERWRITE == 0 and bio:getPower() <= 3) or (DIA_OVERWRITE == 1 and bio:getPower() < 3)) then
        target:addStatusEffect(EFFECT_DIA,3+dotBonus,3,duration,FLAG_ERASABLE, 15);
        spell:setMsg(2);
    else
        spell:setMsg(75);
    end

    -- Try to kill same tier Bio
    if (BIO_OVERWRITE == 1 and bio ~= nil) then
        if (bio:getPower() <= 3) then
            target:delStatusEffect(EFFECT_BIO);
        end
    end

    return final;

end;
