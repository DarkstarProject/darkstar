---------------------------------------------
--  Tremorous Tread
--
--  Description: Deals damage to players in an area of effect. Additional effect: Stun
--  Type: Physical
--  2-3 Shadows
--  Range: Unknown
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
    local dmgmod = 1;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_2_SHADOW);

    local typeEffect = dsp.effects.STUN;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 3);
    target:delHP(dmg);
    return dmg;
end;
