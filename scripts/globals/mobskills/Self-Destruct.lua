---------------------------------------------------
-- Self-Destruct
-- 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	dmgmod = 1;
	accmod = 1;
	if(mob:getHP()~=0) then
		BOMB_TOSS_HPP = mob:getHP()/mob:getMaxHP();
	end
	
	info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*25*BOMB_TOSS_HPP,accmod,dmgmod,TP_MAB_BONUS,1);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
	mob:setHP(0);
	target:delHP(dmg);
	return dmg;
end