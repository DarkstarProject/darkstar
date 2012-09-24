---------------------------------------------
--  Concussive Oscillation
--  Smacks around all nearby targets. Additional effect: Knockback + Weight
--  Utsusemi/Blink absorb: 2-3 shadows
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)

	-- KNOCKBACK

	local typeEffect = EFFECT_WEIGHT;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,4);
		if(resist > 0.5) then
			target:addStatusEffect(typeEffect,1,0,300);
		end
	end

	local numhits = 1;
	local accmod = 4;
	local dmgmod = 5;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_3_SHADOW);
	target:delHP(dmg);
	return dmg;
end;
