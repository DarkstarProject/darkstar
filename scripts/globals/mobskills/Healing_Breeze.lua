---------------------------------------------
--  Healing Breeze
--
--  Description: Restores HP for party members within area of effect.
--  Type: Magical (Wind)
--  
--  
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	local m = math.random(1,4)+6;
	local base = (mob:getMaxHP()/100)* m;
	local mobHP = mob:getHP();
	local mobMaxHP = mob:getMaxHP();
	if(mobHP+base > mobMaxHP) then
		base = mobMaxHP - mobHP; --cap it
	end
	skill:setMsg(MSG_SELF_HEAL);
	mob:addHP(base);
	return base;
end;
