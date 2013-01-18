---------------------------------------------
--  Bilgestorm
--
--  Description: Deals damage in an area of effect. Additional effect: Lowers attack, accuracy, and defense
--  Type: Physical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown
--  Notes: Only used at low health.*Experienced the use at 75%*
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local power = math.random(20,25);

	local statmod = MOD_INT;
	local typeEffect = EFFECT_ACCURACY_DOWN;
	local resist = 1;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,power,0,60);--tic=0;duration=60;
		end
	end

	typeEffect = EFFECT_ATTACK_DOWN;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,3);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,power,0,60);--tic=0;duration=60;
		end
	end

	typeEffect = EFFECT_DEFENSE_DOWN;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,4);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,power,0,60);--tic=0;duration=60;
		end
	end

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
