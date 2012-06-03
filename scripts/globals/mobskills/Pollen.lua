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

function OnMobWeaponSkill(target, mob, skill)

	m = math.random(1,4)+3; -- Sets multiplier to 4-7
	base = (mob:getMaxHP()/100)* m; -- Finds out how much hp 1% of the monsters total hp is and then multiplies it by our above multiplyer
									--  the end result is that the monster will heal 4-7% of it's hp when using this move.
	if(mob:getHP()+base > mob:getMaxHP()) then  -- If the heal would make the monsters hp go above it's Max hp then 
		base = mob:getMaxHP() - mob:getHP(); -- this line caps it at the max possible heal
	end
	skill:setMsg(MSG_SELF_HEAL);
	mob:addHP(base);
	return base;
end