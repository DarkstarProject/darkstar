---------------------------------------------
--  Fevered Pitch
--  Deals damage to a single target. Additional effect: Stun and Defense Down
--  Utsusemi/Blink absorb: 1 shadow
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	if (mob:AnimationSub() == 1) then
		return 1;
	else	
	return 0;
	end
end;

function onMobWeaponSkill(target, mob, skill)

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2.5;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_DEFENSE_DOWN, 30, 0, 120);

    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_STUN, 1, 0, 4);

	target:delHP(dmg);
	return dmg;
end;
