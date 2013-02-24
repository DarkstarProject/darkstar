---------------------------------------------
--  Horror Cloud
--
--  Description: A debilitating cloud slows the attack speed of a single target.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Melee
--  Notes: Can be overwritten and blocked by Haste.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_SLOW;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 358, 0, 120));

	return typeEffect;
end;
