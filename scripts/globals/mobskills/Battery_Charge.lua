---------------------------------------------
--  Battery Charge
--  Description: Gradually restores MP.
--  Type: Magical (Light)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	skill:setMsg(MSG_BUFF);
	local typeEffect = EFFECT_REFRESH
	mob:delStatusEffect(typeEffect);
	mob:addStatusEffect(typeEffect,3,3,300);
	return typeEffect;
end;
