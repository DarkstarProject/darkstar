---------------------------------------------
--  Dark Wave
--
--  Description: A wave of dark energy washes over targets in an area of effect. Additional effect: Bio
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' radial
--  Notes: Severity of Bio effect varies by time of day, from 8/tic at midday to 20/tic at midnight.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.BIO;

    local cTime = VanadielHour();
    local power = 8;
    if (12 <= cTime) then
        local power = 8 + (cTime - 11);
    end

    MobStatusEffectMove(mob, target, typeEffect, power, 3, 60);

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,ELE_DARK,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
