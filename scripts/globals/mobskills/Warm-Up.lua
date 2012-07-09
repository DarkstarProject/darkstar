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
	
	base = mob:getMainLvl() + 0.05*mob:getMaxHP()*(skill:getTP()/100); --base is around 5~150 level depending
	skill:setMsg(MSG_BUFF);
	if(mob:getStatusEffect(EFFECT_ACCURACY_BOOST) ~= nil) then
		mob:delStatusEffect(EFFECT_ACCURACY_BOOST);
	end
	if(mob:getStatusEffect(EFFECT_EVASION_BOOST) ~= nil) then
		mob:delStatusEffect(EFFECT_EVASION_BOOST);
	end
	
	mob:addStatusEffect(EFFECT_ACCURACY_BOOST,base,0,30);
	mob:addStatusEffect(EFFECT_EVASION_BOOST,base,0,30);
	
	return EFFECT_ACCURACY_BOOST;
end;