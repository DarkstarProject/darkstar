---------------------------------------------
--  Pelagic Tempest
--
--  Description: Delivers an area attack that inflicts Shock and Terror.
--  Type: Physical?
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' cone
--  Notes: Used by Murex affiliated with lightning element. Shock effect is fairly strong (28/tick).
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_SHOCK;
	local statmod = MOD_INT;
	local resist = 1;
	if(target:hasStatusEffect(typeEffect) == false) then
	resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,6);
		if(resist > 0.5) then
			target:addStatusEffect(typeEffect,28,3,180);
		end
	end

	typeEffect = EFFECT_TERROR;
	if(target:hasStatusEffect(typeEffect) == false) then
		statmod = MOD_INT;
		resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,8);
		if(resist > 0.5) then
			target:addStatusEffect(typeEffect,1,0,180);
		end
	end

	local numhits = 1;
	local accmod = 2;
	local dmgmod = 3;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
