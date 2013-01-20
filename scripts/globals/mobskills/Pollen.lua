---------------------------------------------------
--  Pollen
--
--  Description: Restores HP.
--
---------------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local m = math.random(1,4)+5; -- Sets multiplier to 6-9
	local mobHP = mob:getHP();
	local mobMaxHP = mob:getMaxHP();
	local base = (mobMaxHP/100)* m; -- Finds out how much hp 1% of the monsters total hp is and then multiplies it by our above multiplyer
									--  the end result is that the monster will heal 4-7% of it's hp when using this move.
	if(mobHP+base > mobMaxHP) then  -- If the heal would make the monsters hp go above it's Max hp then
		base = mobMaxHP - mobHP; -- this line caps it at the max possible heal
	end
	skill:setMsg(MSG_SELF_HEAL);
	mob:addHP(base);
	return base;
end;
