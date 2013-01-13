---------------------------------------------
--  Circle of Flames
--
--  Description: Deals damage to targets in an area of effect. Additional effect: Weight
--  Type: Physical
--  Utsusemi/Blink absorb: 1-3 shadows
--  Range: 10' radial
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
	local typeEffect = EFFECT_WEIGHT;
	if(target:hasStatusEffect(typeEffect) == true) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,4);
		if(resist > 0.3) then
			target:addStatusEffect(typeEffect,1,0,60);--power=1;tic=0;duration=60;
		end
	end

	local numhits = math.random(1,3);
	local accmod = 1;
	local dmgmod = .8;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
