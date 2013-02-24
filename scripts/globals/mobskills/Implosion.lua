---------------------------------------------
--  Sweep
--
--  Description: Damages enemies in an area of effect. Additional effect: Stun
--  Type: Magical
--  Wipes Shadows
--  Range: 10' radial
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)

    local numhits = 1;
    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 2.6,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

    local typeEffect = EFFECT_STUN;

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 4);

    target:delHP(dmg);
    return dmg;
end;
