---------------------------------------------------
-- Searing Light
-- Deals light elemental damage to enemies within area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 3;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 9,ELE_LIGHT,dmgmod,TP_NO_EFFECT,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHT,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end
