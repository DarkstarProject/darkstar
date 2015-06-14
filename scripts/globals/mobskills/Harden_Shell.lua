---------------------------------------------
--  Harden Shell
--
--  Description: Enhances defense.
--  Type: Magical (Earth)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_DEFENSE_BOOST;

    skill:setMsg(MobBuffMove(mob, typeEffect, 100, 0, 60));
	return typeEffect;
end;
