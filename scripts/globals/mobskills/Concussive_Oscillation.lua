---------------------------------------------
--  Concussive Oscillation
--  Smacks around all nearby targets. Additional effect: Knockback + Weight
--  Utsusemi/Blink absorb: 2-3 shadows
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 3;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded*math.random(2,3));
	target:delHP(dmg);

	-- KNOCKBACK

	local typeEffect = EFFECT_WEIGHT;
	if(target:hasStatusEffect(typeEffect) == false and MobPhysicalHit(skill, dmg, target, info.hitslanded)) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_WIND);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,50,0,300*resist);
		end
	end

	return dmg;
end;
