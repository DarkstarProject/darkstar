---------------------------------------------
--  Bad Breath
--
--  Description: Deals earth damage that inflicts multiple status ailments on enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Earth)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_SLOW;
	local statmod = MOD_INT;
	local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_EARTH);
	if(target:hasStatusEffect(typeEffect) == false) then
		if(resist > 0.2) then
            target:delStatusEffect(EFFECT_HASTE);
			target:addStatusEffect(typeEffect,256,0,60*resist);--power=15;tic=0;duration=60;
		end
	end

	typeEffect = EFFECT_POISON;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_EARTH);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,(mob:getMainLvl()/10),3,60*resist);--power=(moblvl/10)+10;tic=3;duration=60;
		end
	end

	typeEffect = EFFECT_SILENCE;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_EARTH);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,1,0,60*resist);--power=1;tic=0;duration=60;
		end
	end

	typeEffect = EFFECT_PARALYSIS;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_EARTH);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,10,0,60*resist);--power=18;tic=0;duration=60;
		end
	end

	typeEffect = EFFECT_BIND;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_EARTH);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,1,0,30*resist);--power=1;tic=0;duration=30;
		end
	end

	typeEffect = EFFECT_BLINDNESS;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_EARTH);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,15,0,60*resist);--power=15;tic=0;duration=60;
		end
	end

	typeEffect = EFFECT_WEIGHT;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_EARTH);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,50,0,60*resist);--power=30;tic=0;duration=60;
		end
	end

	local dmgmod = MobBreathMove(mob, target, 0.3, 1.25, ELE_EARTH, 500);

	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
