---------------------------------------------------
-- Omega Javelin
-- Pierces a single target with an ethereal javelin. Additional effect: Petrification
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_3_SHADOW);
    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_PETRIFICATION, 1, 0, 45);
	target:delHP(dmg);
    mob:resetEnmity(target);
	return dmg;
end;
