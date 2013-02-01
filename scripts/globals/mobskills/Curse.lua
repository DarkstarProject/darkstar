---------------------------------------------
--  Curse
--
--  Description: Inflicts a curse on all targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 15' radial
--  Notes: Curse has a very long duration.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local message = MSG_MISS;
	local typeEffect = EFFECT_CURSE_I;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local duration = 480;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_DARK);
		if(resist > 0.5) then
			duration = duration - (duration/3);
		end
		if(resist > 0.1) then
			message = MSG_ENFEEB_IS;
			target:addStatusEffect(typeEffect,30,0,duration);--power=1;tic=0;
		end
	else
		message = MSG_NO_EFFECT;
	end
	skill:setMsg(message);
	return typeEffect;
end;
