---------------------------------------------
--  Lethe Arrows
--
--  Description: Deals a ranged attack to target. Additional effect: Knockback, Bind, and Amnesia
--  Type: Ranged
--  Utsusemi/Blink absorb: Ignores Utsusemi
--  Range: Unknown
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
	local typeEffect = EFFECT_BIND;
	local resist = 1;
	local statmod = MOD_INT;
	if(target:hasStatusEffect(typeEffect) == false) then
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_ICE);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,1,0,120*resist);--power=1;tic=0;duration=120;
		end
	end

	typeEffect = EFFECT_AMNESIA;
	if(target:hasStatusEffect(typeEffect) == false) then
		--statmod = MOD_INT;
		resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_EARTH);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,1,0,120*resist);--power=1;tic=0;duration=120;
		end
	end

	local numhits = 1;
	local accmod = 3;
	local dmgmod = 4;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
