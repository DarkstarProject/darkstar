require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	dmgmod = 1;
	accmod = 1;
	dmg = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*10,accmod,dmgmod,TP_MAB_BONUS,1);
	target:delHP(dmg);
	return dmg;
end