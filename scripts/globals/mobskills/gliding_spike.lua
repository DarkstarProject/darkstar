---------------------------------------------
-- Gliding Spike
--
-- Description: Damage varies with TP. Strikes a single target with a spike. Additional effect: Knockback + Stun
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
    local accmod = 1;
    local dmgmod = 2.5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);
    local typeEffect = EFFECT.STUN;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 4);

    target:delHP(dmg);
    return dmg;
end;
