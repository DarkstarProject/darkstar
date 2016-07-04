---------------------------------------------
--  Abyssal Strike
--
--  effect: Stun
--  Type: Physical
--  Notes: zeid and shadows of rage move
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
    local dmgmod = 4.7;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);

    local typeEffect = EFFECT_STUN;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 4);

    target:delHP(dmg);
    return dmg;
end;