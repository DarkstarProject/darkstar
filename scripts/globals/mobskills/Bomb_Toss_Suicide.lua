require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	dmgmod = 1;
	accmod = 1;
	dmg = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*30*(mob:getHP()/mob:getMaxHP()),accmod,dmgmod,TP_MAB_BONUS,1);
	mob:setHP(0);
	target:delHP(dmg);
	return dmg;
end