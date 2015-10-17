---------------------------------------------
--  Memory Of Dark
--
--  Description: Deals dark damage.
--  Type: Magical (Dark)
--
--
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
    local accmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_DARK,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
