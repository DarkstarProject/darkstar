---------------------------------------------
--  Asthenic Fog
--
--  Description: A mist drowns all nearby targets.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
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
	local typeEffect = EFFECT_DROWN;
	local message = MSG_MISS;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,3);
		if(resist > 0.5) then
			message = MSG_ENFEEB_IS;
			target:addStatusEffect(typeEffect,15,3,120);--power=15;tic=3;duration=120;
		end
	else
		message = MSG_NO_EFFECT;
	end
	skill:setMsg(message);
	return typeEffect;
end;
