require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	dmgmod = 1;
	accmod = 1;
	dmg = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*30*(mob:getHP()/mob:getMaxHP()),accmod,dmgmod,TP_MAB_BONUS,1);
	mob:setHP(1); --VERY IMPORTANT, REV1101, CANNOT SETHP TO 0, BUG! USE 1 INSTEAD!
	target:delHP(dmg);
	return dmg;
end