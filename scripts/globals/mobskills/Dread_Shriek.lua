---------------------------------------------
--  Dread Shriek
--
--  Description: An unsettling shriek paralyzes targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' radial
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
	local message = MSG_MISS;
	local typeEffect = EFFECT_PARALYSIS;
	if(target:hasStatusEffect(typeEffect) == false) then
			local statmod = MOD_INT;
			local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,5);
			if(resist > 0.5) then
				message = MSG_ENFEEB_IS;
				target:addStatusEffect(typeEffect,30,0,60);--power=30;tic=0;duration=60;
			end
	else
		message = MSG_NO_EFFECT;
	end
	skill:setMsg(message);
	return typeEffect;
end;
