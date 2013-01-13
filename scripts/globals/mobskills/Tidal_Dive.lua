---------------------------------------------
--  Tidal Dive
--
--  Description: Dives at nearby targets. Additional effect: Weight and/or Bind (Status Effect)
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Unknown radial
--  Notes: Only used over deep water.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local duration = 0;
	local typeEffect = EFFECT_BIND;
	local statmod = MOD_INT;
	local resist = 0
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,5);
		if(resist > 0.5) then
			duration = skill:getTP()/100 * math.random(3,5) + 18;
			target:addStatusEffect(typeEffect,1,0,duration);--power=1;tic=0;
		end
	end

	typeEffect = EFFECT_WEIGHT;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,4);
		if(resist > 0.5) then
			duration = skill:getTP()/100 * math.random(3,5) + 18;
			target:addStatusEffect(typeEffect,1,0,duration);--power=1;tic=0;
		end
	end

	local numhits = math.random(2, 3);
	local accmod = 1;
	local dmgmod = .8;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
