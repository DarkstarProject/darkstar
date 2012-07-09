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
	if(mob:getStatusEffect(EFFECT_MAGIC_DEF_BOOST) ~= nil) then
		mob:delStatusEffect(EFFECT_MAGIC_DEF_BOOST);
	end
	mob:addStatusEffect(EFFECT_MAGIC_DEF_BOOST,50,0,60);
	return EFFECT_MAGIC_DEF_BOOST;

end;