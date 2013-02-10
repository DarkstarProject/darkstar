---------------------------------------------
--  Primal Drill
--
--  Description: Drills into nearby targets with appendages. Additional effect: Bind
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Unknown radial
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

	local numhits = math.random(2,3);
	local accmod = 1;
	local dmgmod = .8;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);

	local typeEffect = EFFECT_BIND;
	if(target:hasStatusEffect(typeEffect) == false and MobPhysicalHit(skill, dmg, target, info.hitslanded)) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_ICE);
		if(resist > 0.2) then
			local duration = ((skill:getTP()/100) * 5 )+ 15;
			if(resist > .7) then
				duration = duration - (resist * 10 )- 7;
			end
			target:addStatusEffect(typeEffect,1,3,duration*resist);--power=1;tic=3;
		end
	end

	target:delHP(dmg);
	return dmg;
end;
