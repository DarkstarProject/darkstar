---------------------------------------------
--  Warm-Up
--
--  Description: Enhances accuracy and evasion.
--  Type: Magical (Earth)
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local base = mob:getMainLvl() + 0.05*mob:getMaxHP()*(skill:getTP()/1000); --base is around 5~150 level depending

    skill:setMsg(MobBuffMove(mob, EFFECT_EVASION_BOOST, base, 0, 180));
    skill:setMsg(MobBuffMove(mob, EFFECT_ACCURACY_BOOST, base, 0, 180));

    return EFFECT_ACCURACY_BOOST;
end;
