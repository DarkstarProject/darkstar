---------------------------------------------
--  Mantle Pierce
--
--  Description: Stabs a single target. Additional effect: Weight
--  Type: Physical
--  Utsusemi/Blink absorb: 1-3 shadow(s)
--  Range: Melee
--  Notes:
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local numhits = math.random(1,3);
    local accmod = 2;
    local dmgmod = 2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);

    local typeEffect = EFFECT_WEIGHT;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 50, 0, 120);

    target:delHP(dmg);
    return dmg;
end;
