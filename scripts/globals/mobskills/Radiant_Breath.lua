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
	local resist = 1;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,typeEffect,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_LIGHT);
		if(resist > 0.2) then
            target:delStatusEffect(EFFECT_HASTE);
			target:addStatusEffect(typeEffect,20,0,90*resist);--power=12;tic=0;duration=60;
		end
	end

	typeEffect = EFFECT_SILENCE;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,typeEffect,target,mob:getMod(statmod)-target:getMod(statmod),0,4);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,12,0,90*resist);--power=12;tic=0;duration=60;
		end
	end

	local dmgmod = MobBreathMove(mob, target, 0.2, 0.75, ELE_LIGHT, 500);

	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHT,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
