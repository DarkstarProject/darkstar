---------------------------------------------
--  Dark Wave
--
--  Description: A wave of dark energy washes over targets in an area of effect. Additional effect: Bio
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' radial
--  Notes: Severity of Bio effect varies by time of day, from 8/tic at midday to 20/tic at midnight.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_BIO;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,8);
		if(resist > 0.2) then
			local cTime = VanadielHour();
			if(12 <= cTime) then
				local power = 8 + (cTime - 11);
			end
			target:addStatusEffect(typeEffect,power,3,30);--tic=3;duration=30;
		end
	end

	local dmgmod = 1.5;
	local accmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*1.5,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
