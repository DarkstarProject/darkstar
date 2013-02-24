---------------------------------------------
--  Battery Charge
--  Description: Gradually restores MP.
--  Type: Magical (Light)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_REFRESH;

    skill:setMsg(MobBuffMove(mob, typeEffect, 3, 3, 300));

	return typeEffect;
end;
