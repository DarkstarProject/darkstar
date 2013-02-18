---------------------------------------------
--  Blindeye
--
--  Description: Inflicts damage on a single target. Additional effect: Blind
--  Type: Physical
--  Utsusemi/Blink absorb: Yes
--  Range: Single target
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
	local dmgmod = 2.4;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
	target:delHP(dmg);

	local typeEffect = EFFECT_BLINDNESS;
	if(target:hasStatusEffect(typeEffect) == false and MobPhysicalHit(skill, dmg, target, info.hitslanded)) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_DARK);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,15,0,120*resist);--power=8;tic=0;duration=60;
		end
	end

	return dmg;
end;
