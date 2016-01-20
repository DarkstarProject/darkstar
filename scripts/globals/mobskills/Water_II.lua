---------------------------------------------------
-- Water II
-- Deals water elemental damage. Damage varies with TP.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    dmgmod = 1;
    info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 3,ELE_WATER,dmgmod,TP_MAB_BONUS,1);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;

end