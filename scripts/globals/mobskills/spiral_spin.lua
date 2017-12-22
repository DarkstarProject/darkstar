---------------------------------------------
--  Spiral Spin
--
--  Description: Chance of effect varies with TP. Additional Effect: Accuracy Down.
--  Type: Physical (Slashing)
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1;
    local accmod = 2;
    local dmgmod = 3;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local typeEffect = EFFECT_ACCURACY_DOWN;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 50, 0, 120);

    target:delHP(dmg);
    return dmg;
end;
