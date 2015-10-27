---------------------------------------------
--  Malevolent Blessing
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local typeEffect = EFFECT_CURSE_I;

	MobStatusEffectMove(mob, target, typeEffect, 35, 0, 45);

	local dmgmod = 1.25;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 3,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_2_SHADOW);
	target:delHP(dmg);
	return dmg;
end;
