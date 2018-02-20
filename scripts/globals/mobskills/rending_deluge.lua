---------------------------------------------------
-- Rending Deluge
-- Deals water damage to enemies within range. Additional effect: Dispel.
---------------------------------------------
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg(),ELE_WATER,dmgmod,TP_NO_EFFECT,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);

    target:dispelStatusEffect();

    target:delHP(dmg);
    return dmg;
end;
