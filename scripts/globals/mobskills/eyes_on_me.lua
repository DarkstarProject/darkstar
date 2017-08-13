---------------------------------------------
--  Eyes on Me
--  Deals dark damage to an enemy.
--  Spell Type: Magical (Dark)
--  Range: Casting range 13'
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = mob:getWeaponDmg() * 4;

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_SPECIAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);

    return dmg;
end;
