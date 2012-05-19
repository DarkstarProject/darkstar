---------------------------------------------------
-- Aqua Ball
-- Deals Water damage in a splash area of effect. Additional effect: STR Down
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	dmgmod = 1;
	accmod = 1;
	info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_MAB_BONUS,1);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_1_SHADOW);
	target:delHP(dmg);
	mob:addHP(dmg);
	return dmg;
	
end