---------------------------------------------
--  Severing_Fang
--  Deals damage to a single target. Additional effect: Defense Down
--  Utsusemi/Blink absorb: 2 shadows
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local numhits = 2;
	local accmod = 1;
	local dmgmod = 2;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_FROST, 30, 0, 120);

	target:delHP(dmg);
	return dmg;
end;
