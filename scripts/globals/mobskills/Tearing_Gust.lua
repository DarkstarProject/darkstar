---------------------------------------------
--  Gregale Wing
--
--  Description: An icy wind deals Ice damage to enemies within a very wide area of effect. Additional effect: Paralyze
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 30' radial.
--  Notes: Used only by Jormungand and Isgebind
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_WEAKNESS;

	MobStatusEffectMove(mob, target, typeEffect, 40, 0, 120);

	local dmgmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,ELE_ICE,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_ICE,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
