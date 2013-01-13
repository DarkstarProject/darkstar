---------------------------------------------
--  Horror Cloud
--
--  Description: A debilitating cloud slows the attack speed of a single target.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Melee
--  Notes: Can be overwritten and blocked by Haste.
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
	local typeEffect = EFFECT_SLOW;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
		if(resist > 0.5) then
			message = MSG_ENFEEB_IS;
			target:addStatusEffect(typeEffect,35,0,60);--power=35;tic=0;duration=60;
		end
	else
		message = MSG_NO_EFFECT;
	end
	skill:setMsg(message);
	return typeEffect;
end;
