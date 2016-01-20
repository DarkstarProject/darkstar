---------------------------------------------
--  Nocturnal Combustion
--
--  Description: Self-destructs, releasing dark energy at nearby targets.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 20'  radial
--  Notes: Damage is based on remaining HP and time of day (more damaging near midnight). The djinn will not use this until it has been affected by the current day's element.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1;
    local BOMB_TOSS_HPP = skill:getHPP() / 100;

    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*20*BOMB_TOSS_HPP,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    mob:setHP(0);
    target:delHP(dmg);
    return dmg;
end;
