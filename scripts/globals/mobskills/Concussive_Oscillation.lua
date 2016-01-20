---------------------------------------------
--  Concussive Oscillation
--  Smacks around all nearby targets. Additional effect: Knockback + Weight
--  Utsusemi/Blink absorb: 2-3 shadows
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
    local accmod = 1;
    local dmgmod = 2.3;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,MOBPARAM_3_SHADOW);
    target:delHP(dmg);

    -- KNOCKBACK

    local typeEffect = EFFECT_WEIGHT;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 50, 0, 300);

    return dmg;
end;
