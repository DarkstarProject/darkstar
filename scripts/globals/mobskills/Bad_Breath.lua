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
	local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
	if(target:hasStatusEffect(typeEffect) == false) then
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,15,0,60);--power=15;tic=0;duration=60;
		end
	end

	typeEffect = EFFECT_POISON;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,mob:getMainLvl()/10 + 10,3,60);--power=(moblvl/10)+10;tic=3;duration=60;
		end
	end

	typeEffect = EFFECT_SILENCE;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,1,0,60);--power=1;tic=0;duration=60;
		end
	end

	typeEffect = EFFECT_PARALYSIS;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,5);
		if(resist > 0.2) then
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(typeEffect,18,0,60);--power=18;tic=0;duration=60;
		end
	end

	typeEffect = EFFECT_BIND;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,5);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,1,0,30);--power=1;tic=0;duration=30;
		end
	end

	typeEffect = EFFECT_BLINDNESS;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,8);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,15,0,60);--power=15;tic=0;duration=60;
		end
	end

	typeEffect = EFFECT_WEIGHT;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,4);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,30,0,60);--power=30;tic=0;duration=60;
		end
	end

	local dmgmod = mob:getHP() / mob:getMaxHP() * 2;
	local accmod = 1.5;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
