---------------------------------------------
--  Saline Coat
--
--  Description: Enhances magic defense.
--  Type: Magical (Light)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	skill:setMsg(MSG_BUFF);
	local typeEffect = EFFECT_MAGIC_DEF_BOOST;
	mob:delStatusEffect(typeEffect);
	mob:addStatusEffect(typeEffect,50,0,60);
	return typeEffect;
end;
