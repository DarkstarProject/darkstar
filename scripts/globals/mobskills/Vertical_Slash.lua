---------------------------------------------
--  Vertical Slash
--
--  Description: Vertically slashes a single target. Additional effect: Accuracy Down
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
	local typeEffect = EFFECT_ACCURACY_DOWN;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		target:addStatusEffect(typeEffect,25,0,120);--power=50;tic=0;duration=120;
	end

	local numhits = 1;
	local accmod = 2;
	local dmgmod = math.random(1,2);
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_1_SHADOW);
	target:delHP(dmg);
	return dmg;
end;
