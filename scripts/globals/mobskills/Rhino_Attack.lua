---------------------------------------------
-- Rhino_Attack
-- Deals damage to a single target. Additional effect: Knockback
-- Utsusemi/Blink absorb: 1 shadow
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	-- KNOCKBACK

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2.5;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,MOBPARAM_1_SHADOW);
	target:delHP(dmg);
	return dmg;
end
