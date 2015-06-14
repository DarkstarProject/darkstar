---------------------------------------------
--  Rage
--
--  Description: The Ram goes berserk
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: 25% Attack UP, -25% defense DOWN
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local duration = 60;

	local typeEffect = EFFECT_BERSERK;
    skill:setMsg(MobBuffMove(mob, typeEffect, 1, 0, duration));
	return typeEffect;
end;
