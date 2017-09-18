-----------------------------------------
-- Spell: Diaga
-- Lowers an enemy's defense and gradually deals light elemental damage.
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
    local params = {};
    params.dmg = basedmg;
    params.multiplier = 1;
    params.skillType = ENFEEBLING_MAGIC_SKILL;
    params.attribute = MOD_INT;
    params.hasMultipleTargetReduction = false;

    local dmg = calculateMagicDamage(caster, target, spell, params);

    dmg = utils.clamp(dmg, 1, 12);

    --get resist multiplier (1x if no resist)
   local params = {};params.diff = caster:getStat(MOD_INT)-target:getStat(MOD_INT);params.attribute = MOD_INT;params.skillType = ENFEEBLING_MAGIC_SKILL;params.bonus = 1.0;resist = applyResistance(caster, target, spell, params);
    --get the resisted damage
    dmg = dmg*resist;
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster,spell,target,dmg);
    --add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement());

    --add in final adjustments including the actual damage dealt
    local final = finalMagicAdjustments(caster,target,spell,dmg);

    -- Calculate duration.
    local duration = 60;
    local dotBonus = 0;
    
    if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
        duration = duration * 2;
    end
    caster:delStatusEffect(EFFECT_SABOTEUR);
    
    dotBonus = dotBonus+caster:getMod(MOD_DIA_DOT);  -- Dia Wand

    -- Check for Bio.
    local bio = target:getStatusEffect(EFFECT_BIO);

    -- Do it!
    if (DIA_OVERWRITE == 0 or (DIA_OVERWRITE == 1 and bio == nil)) then
        target:addStatusEffect(EFFECT_DIA,1+dotBonus,3,duration, 0, 5);
        spell:setMsg(2);
    else
        spell:setMsg(75);
    end

    -- Try to kill same tier Bio
    if (BIO_OVERWRITE == 1 and bio ~= nil) then
        if (bio:getPower() == 1) then
            target:delStatusEffect(EFFECT_BIO);
        end
    end

    return final;

end;