---------------------------------------------
--  Drop Hammer
--
--  Description: Drops the hammer. Additional effect: Bind
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows?
--  Range: Melee
--  Notes: Only used by "destroyers" (carrying massive warhammers).
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
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,math.random(2,3));

	local typeEffect = EFFECT_BIND;
	if(target:hasStatusEffect(typeEffect) == false and MobPhysicalHit(skill, dmg, target, info.hitslanded)) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,5);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,1,0,120);--power=1;tic=0;duration=120;
		end
	end

	target:delHP(dmg);
	return dmg;
end;
