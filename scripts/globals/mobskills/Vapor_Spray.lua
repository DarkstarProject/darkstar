---------------------------------------------
--  Vapor Spray
--
--  Description: Deals Water breath damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Water)
--  
--  
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	local dmgmod = 1;
	local accmod = .8;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()* 1.5,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
