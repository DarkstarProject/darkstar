---------------------------------------------------
-- Grand Fall
-- Leviathan deals water elemental damage to target. 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	dmgmod = 3;
	accmod = 2;
	info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 3,accmod,dmgmod,TP_MAB_BONUS,1);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
	
end