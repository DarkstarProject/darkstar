---------------------------------------------
--  Thermal Pulse
--  Family: Wamouracampa
--  Description: Deals Fire damage to enemies within area of effect. Additional effect: Blindness 
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadow
--  Range: 12.5
--  Notes: Open form only.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:AnimationSub() ~=0) then
        return 1;
    else
        return 0;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_BLINDNESS;

    MobStatusEffectMove(mob, target, typeEffect, 20, 0, 60);

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_FIRE,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
