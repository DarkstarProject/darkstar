---------------------------------------------------
-- Spring Water
-- Leviathan restores hit points to party members within area of effect and cures some status ailments.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	
	base = mob:getMainLvl() + 2*mob:getMainLvl()*(skill:getTP()/100); --base is around 5~150 level depending
	M = 5;
	multiplier = 1+(1- (mob:getHP()/mob:getMaxHP())) * M;	--higher multiplier the lower your HP. at 15% HP, multiplier is 1+0.85*M
	base = base * multiplier;
	
	if(mob:getHP()+base > mob:getMaxHP()) then
		base = mob:getMaxHP() - mob:getHP(); --cap it
	end
	skill:setMsg(MSG_SELF_HEAL);
	mob:addHP(base);
	return base;
	
end