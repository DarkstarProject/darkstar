---------------------------------------------
--  Erosion Dust
--  Family: Wamoura
--  Description: Spreads eroding dust particles on targets in an area of effect, dealing Light damage and inflicting Dia. 
--  Type: Magical (Light)
--  Utsusemi/Blink absorb: Wipes shadows 
--  Range: Radial
--  Notes: Def down 15%, 11/tic damage
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_DIA;
    local power = 11;
    local subpower = 15;
    local duration = 150;

    MobStatusEffectMove(mob, target, typeEffect, power, 3, duration, FLAG_ERASABLE, subpower);

    local dmgmod = 1.5;
    local accmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.5,ELE_FIRE,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHT,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;