---------------------------------------------
-- True Strike
--
-- Description: Deals critical damage. Accuracy varies with TP.
-- Type: Physical
-- Utsusemi/Blink absorb: 1 Shadow
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    mob:messageBasic(43, 0, 166);
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 0.6;
    local dmgmod = 3.0;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_ACC_VARIES,1.1,1.2,1.3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);

    skill:setSkillchain(166);

    target:delHP(dmg);
    return dmg;
end;
