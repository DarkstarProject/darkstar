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
	if(mob:getStatusEffect(EFFECT_REFRESH) ~= nil) then
		mob:delStatusEffect(EFFECT_REFRESH);
	end
	mob:addStatusEffect(EFFECT_REFRESH,3,3,300);
	return EFFECT_REFRESH;
	
end