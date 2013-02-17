---------------------------------------------
--  Rime Spray
--
--  Description: Deals Ice damage to enemies within a fan-shaped area, inflicting them with Frost and All statuses down.
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
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
	local typeEffect = EFFECT_FROST;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_ICE);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,15,3,120);--power=15;tic=3;duration=120;
			if (target:hasStatusEffect(EFFECT_STR_DOWN) == false) then
				target:addStatusEffect(EFFECT_STR_DOWN,20,3,60);
			end
			if (target:hasStatusEffect(EFFECT_VIT_DOWN) == false) then
				target:addStatusEffect(EFFECT_VIT_DOWN,20,3,60);
			end
			if (target:hasStatusEffect(EFFECT_DEX_DOWN) == false) then
				target:addStatusEffect(EFFECT_DEX_DOWN,20,3,60);
			end
			if (target:hasStatusEffect(EFFECT_AGI_DOWN) == false) then
				target:addStatusEffect(EFFECT_AGI_DOWN,20,3,60);
			end
			if (target:hasStatusEffect(EFFECT_MND_DOWN) == false) then
				target:addStatusEffect(EFFECT_MND_DOWN,20,3,60);
			end
			if (target:hasStatusEffect(EFFECT_INT_DOWN) == false) then
				target:addStatusEffect(EFFECT_INT_DOWN,20,3,60);
			end
			if (target:hasStatusEffect(EFFECT_CHR_DOWN) == false) then
				target:addStatusEffect(EFFECT_CHR_DOWN,20,3,60);
			end
		end
	end
	
	local dmgmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_ICE,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_ICE,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
