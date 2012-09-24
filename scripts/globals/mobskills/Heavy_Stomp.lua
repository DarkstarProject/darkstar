---------------------------------------------
--  Heavy Stomp
--
--  Description: Deals heavy damage to targets within an area of effect. Additional effect: Paralysis
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Unknown radial
--  Notes: Paralysis effect has a very long duration.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_PARALYSIS;
	if(target:hasStatusEffect(typeEffect) == false) then
		local accrand = math.random(1,2);
		if(accrand == 1) then
			local statmod = MOD_INT;
			local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,5);
			if(resist > 0.5) then
				target:addStatusEffect(typeEffect,8,3,60);--power=8;tic=3;duration=60;
			end
		end
	end
	local numhits = math.random(2,3);
	local accmod = 1;
	local dmgmod = .3;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
