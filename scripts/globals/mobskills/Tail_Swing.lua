---------------------------------------------
--  Tail Swing
--
--  Description: Deals damage to a single target. Additional effect: Bind
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2.2;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);

	local typeEffect = EFFECT_BIND;
	if(target:hasStatusEffect(typeEffect) == false and info.hitslanded > 0) then
		target:addStatusEffect(typeEffect,1,0,30);--power=1;tic=0;duration=30;
	end

	target:delHP(dmg);
	return dmg;
end;
