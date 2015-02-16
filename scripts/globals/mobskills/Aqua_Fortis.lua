---------------------------------------------
--  Aqua Fortis
--
--  Description: Deals water damage to enemies within area of effect. Additional effect: Silence.
--  Type: Magical (Water)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_SILENCE;

	MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60);

	local dmgmod = 3;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.5,ELE_WATER,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
    MobStatusEffectMove(mob, target, EFFECT_POISON, 1, 0, 60);	
	return dmg;
end;
