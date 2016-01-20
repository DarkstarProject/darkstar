---------------------------------------------
--  Delta Thrust
--
--  Description: Delivers a threefold attack on a single target. Additional effect: Plague
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

    local numhits = 3;
    local accmod = 1;
    local dmgmod = 1;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    target:delHP(dmg);

    local typeEffect = EFFECT_PLAGUE;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 5, 3, 60);

    return dmg;
end;
