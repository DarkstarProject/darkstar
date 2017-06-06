---------------------------------------------
--  Touchdown
--
--  Description: Deals magical damage to enemies in an area of effect upon landing.
--  Further Notes:
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*4,ELE_NONE,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_NONE,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    mob:delStatusEffect(EFFECT_ALL_MISS);
    mob:SetMobSkillAttack(0);
    mob:AnimationSub(2);
    return dmg;
end;
