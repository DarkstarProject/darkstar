---------------------------------------------
--  Gates of Hades
--
--  Description: Deals severe Fire damage to enemies within an area of effect. Additional effect: Burn
--  Type:  Magical
--  
--  
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 20' radial
--  Notes: Only used when a cerberus's health is 25% or lower (may not be the case for Orthrus). The burn effect takes off upwards of 20 HP per tick.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_BURN;
	if(target:hasStatusEffect(typeEffect) == false) then
		local accrand = math.random(1,8);
		if(accrand ~= 1) then
			local statmod = MOD_INT;
			local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,1);
			if(resist > 0.5) then
				if(resist >= 1) then  -- Added just incase resist number retuns a value higher then .9.
					resist = .9;
				end
				local power = ((resist * 10) - 5) * math.random(1,2) + 19; -- makes dot damage between 20 - 28, based off resistance and random variable.
				target:addStatusEffect(typeEffect,power,3,60);--tic=3;duration=60;
			end
		end
	end

	local dmgmod = 1;
	local accmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
