---------------------------------------------
--  Zephyr Mantle
--
--  Description: Creates shadow images that each absorb a single attack directed at you.
--  Type: Magical (Wind)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	local base = math.random(4,10);
	skill:setMsg(MSG_BUFF);
	local typeEffect = EFFECT_BLINK;
	mob:delStatusEffect(typeEffect);
	mob:addStatusEffect(typeEffect,base,0,180);
	return typeEffect;
end;
