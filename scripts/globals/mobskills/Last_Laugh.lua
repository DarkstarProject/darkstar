---------------------------------------------
--  Bad Breath
--
--  Description: Deals earth damage that inflicts multiple status ailments on enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Earth)
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

	MobStatusEffectMove(mob, target, EFFECT_KO, 1, 0, 1);


	local dmgmod = MobBreathMove(mob, target, 0.15, 3, ELE_EARTH, 0);

	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
