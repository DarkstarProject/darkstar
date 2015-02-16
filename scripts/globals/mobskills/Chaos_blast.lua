---------------------------------------------
--  Tebbad Wing
--
--  Description: Deals darkness damage to enemies within a very wide area of effect. Additional effect: Sleep
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 30' radial.
--  Notes: Used only by Vrtra and Azdaja
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local currentHP = target:getHP();
	local damage = 0;

	if(currentHP / target:getMaxHP() > 0.4) then
		damage = currentHP * .50;
	else
		damage = currentHP * .50;
	end
	local dmgmod = 1;
	local dmg = MobFinalAdjustments(damage,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,MOBPARAM_IGNORE_SHADOWS);

	target:delHP(dmg);
	mob:resetEnmity(target);
	return dmg;
end;







