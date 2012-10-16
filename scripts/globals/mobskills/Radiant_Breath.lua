---------------------------------------------
--  Radiant Breath
--
--  Description: Deals light damage to enemies within a fan-shaped area of effect originating from the caster. Additional effect: Slow and Silence.
--  Type: Magical (Light)
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
	local accrand = 1;
	local resist = 1;
	if(target:hasStatusEffect(typeEffect) == false) then
		accrand = math.random(1,2);
		if(accrand == 1) then
			resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
			if(resist > 0.5) then
				target:addStatusEffect(typeEffect,12,0,60);--power=12;tic=0;duration=60;
			end
		end
	end

	typeEffect = EFFECT_SILENCE;
	if(target:hasStatusEffect(typeEffect) == false) then
		accrand = math.random(1,2);
		if(accrand == 1) then
			resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,4);
			if(resist > 0.5) then
				target:addStatusEffect(typeEffect,12,0,60);--power=12;tic=0;duration=60;
			end
		end
	end

	local dmgmod = 1;
	local accmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHT,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
