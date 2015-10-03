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
	
	skill:setMsg(MSG_SELF_HEAL);

	return MobHealMove(target, base);
end
