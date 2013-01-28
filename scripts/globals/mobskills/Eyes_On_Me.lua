---------------------------------------------
--  Eyes on Me
--  Deals dark damage to an enemy.
--  Spell Type: Magical (Dark)
--  Range: Casting range 13'
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local dmgmod = mob:getWeaponDmg() * math.random(4,7);

	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_SPECIAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

	dmg = dmg * (1 + (target:getMod(MOD_DMG) / 100));
	dmg = dmg * (1 + (target:getMod(MOD_DMGMAGIC) / 100));

	target:delHP(dmg);

	return dmg;
end;
