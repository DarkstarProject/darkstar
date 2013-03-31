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
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local m = math.random(1,6)+15;
	local base = (target:getMaxHP()/100)* m;
	local mobHP = target:getHP();
	local mobMaxHP = target:getMaxHP();
	if(mobHP+base > mobMaxHP) then
		base = mobMaxHP - mobHP; --cap it
	end
	skill:setMsg(MSG_SELF_HEAL);
	target:addHP(base);
	return base;
end;
