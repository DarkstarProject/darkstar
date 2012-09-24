---------------------------------------------
--  Warm-Up
--
--  Description: Enhances accuracy and evasion.
--  Type: Magical (Earth)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	local base = mob:getMainLvl() + 0.05*mob:getMaxHP()*(skill:getTP()/100); --base is around 5~150 level depending
	local typeEffect_Acc = EFFECT_ACCURACY_BOOST;
	local typeEffect_Eva = EFFECT_EVASION_BOOST;
	skill:setMsg(MSG_BUFF);

	mob:delStatusEffect(typeEffect_Acc);
	mob:delStatusEffect(typeEffect_Eva);

	mob:addStatusEffect(typeEffect_Acc,base,0,30);
	mob:addStatusEffect(typeEffect_Eva,base,0,30);

	return typeEffect_Acc;
end;
