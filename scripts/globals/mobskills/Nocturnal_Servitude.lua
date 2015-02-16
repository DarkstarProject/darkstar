---------------------------------------------
--  Nocturnal Servitude
--
--  Description: Inflicts a charm on all targets in an area of effect.
--  Type: Enfeebling
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	
	local typeEffect = EFFECT_CHARM_I;
	target:costume(257);
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60));
	
    mob:resetEnmity(target);

	return typeEffect;
end;
