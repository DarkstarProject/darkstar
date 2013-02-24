---------------------------------------------
--  Asthenic Fog
--
--  Description: A mist drowns all nearby targets.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown radial
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_DROWN;

	skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 15, 3, 120));

	return typeEffect;
end;
