--------------------------------------
-- Spell: Kaustra
-- Consumes 20% of your maximum MP. Relentless
-- dark damage slowly devours an enemy.
--------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- onMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local skill = caster:getSkillLevel(DARK_MAGIC_SKILL);
    local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);

    if (skill > 500) then
        skill = 500;
    end
    if (dINT > 300) then
        dINT = 300;
    end

    local duration = 3 * (1 + (skill / 11));
    local base = math.floor((math.floor(0.67 * caster:getMainLvl())/10)*(37 + math.floor(0.67*dINT)))
    local resist = applyResistance(caster,spell,target,dINT,DARK_MAGIC_SKILL,0);
    local dmg = base * resist;
    duration = duration * resist;
    dmg = addBonuses(caster, spell, target, dmg);
    dmg = adjustForTarget(target,dmg,spell:getElement());
    dmg = finalMagicAdjustments(caster,target,spell,dmg);

    target:addStatusEffect(EFFECT_KAUSTRA,math.floor(dmg/3),3,duration);

    return dmg;
end;