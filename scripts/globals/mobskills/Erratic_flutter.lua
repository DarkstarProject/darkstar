---------------------------------------------
--  Erratic Flutter
--  Family: Wamoura
--  Description: Deals Fire damage around the caster. Grants the effect of Haste. 
--  Type: Magical (Fire)
--  Utsusemi/Blink absorb: Wipes shadows 
--  Range: Radial
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
    local typeEffect = EFFECT_HASTE;
    local power = 307; -- 307/1024
    local duration = 500;

    MobBuffMove(mob, typeEffect, power, 0, duration);

    local dmgmod = 1.5;
    local accmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_FIRE,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;