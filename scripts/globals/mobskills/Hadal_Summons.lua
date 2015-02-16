---------------------------------------------------
--  Hadal Summons
--  Description: 
--  Type: Magical
--  additional effect : Burn

---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;


function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_BURN;
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 5, 3, 30);
    local dmgmod = 2;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_LIGHT,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHT,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end
