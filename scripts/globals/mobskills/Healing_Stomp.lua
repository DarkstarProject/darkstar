---------------------------------------------
--  Healing Stomp
--
--  Description: Stomps the ground to apply regeneration.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: Only used by notorious monsters.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local power = 25;
	local duration = 180;

	local typeEffect = EFFECT_REGEN;
	skill:setMsg(MSG_BUFF);
	if(mob:hasStatusEffect(typeEffect) == true) then
		local oldEffect = mob:getStatusEffect(typeEffect);
		oldEffect:setPower(power);
		oldEffect:setDuration(duration);
	else
		mob:addStatusEffect(typeEffect,power,5,duration);--tic=5;
	end
	return typeEffect;
end;
