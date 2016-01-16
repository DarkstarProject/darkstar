---------------------------------------------
--  Molting Burst
--
--  Description: Deals Light damage and drains HP. Transfers any negative status effects to the target.
--  Type: Magical
--  Utsusemi/Blink absorb: Unknown
--  Range: Unknown
--  Notes: Used by Limules affiliated with light element.
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
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,ELE_LIGHT,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHT,MOBPARAM_2_SHADOW);
    target:delHP(dmg);
    return dmg;
end;
