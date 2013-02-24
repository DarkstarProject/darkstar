---------------------------------------------
--  Negative Whirl
--
--  Description: Slow Wipes shadows
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' cone
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_SLOW;

    MobStatusEffectMove(mob, target, typeEffect, 300, 0, 120);

    local dmgmod = 1;

    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,ELE_WIND,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
