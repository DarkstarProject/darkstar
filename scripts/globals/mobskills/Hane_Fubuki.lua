---------------------------------------------
-- Hane Fubuki
-- Description: Additional effect: Poison. Chance of effect varies with TP.
-- Type: Physical (Piercing)
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 2;
    local dmgmod = 3;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);

    local typeEffect = EFFECT_POISON;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, mob:getMainLvl()/7, 3, 120);

    target:delHP(dmg);
    return dmg;
end;
