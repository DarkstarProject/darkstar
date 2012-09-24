---------------------------------------------
--  Disseverment
--
--  Description: Delivers a fivefold attack. Additional effect: Poison. Accuracy varies with TP.
--  Type: Physical (Piercing)
--  
--  
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_POISON;
	if(target:hasStatusEffect(typeEffect) == false) then
		local accrand = math.random(1,2);
		if(accrand == 1) then
			local statmod = MOD_INT;
			local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,3);
			if(resist > 0.5) then
				local power = (mob:getMainLvl()/15) + math.random(2,4) ;
				target:addStatusEffect(typeEffect,power,3,60);--tic=3;duration=60;
			end
		end
	end

	local numhits = 5;
	local accmod = 1;
	local dmgmod = .3;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_ACC_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
