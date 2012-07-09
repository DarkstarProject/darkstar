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
	
	base = math.random(4,10);
	skill:setMsg(MSG_BUFF);
	if(mob:getStatusEffect(EFFECT_BLINK) ~= nil) then
		mob:delStatusEffect(EFFECT_BLINK);
	end
	mob:addStatusEffect(EFFECT_BLINK,base,0,180);
	return EFFECT_BLINK;
	
end