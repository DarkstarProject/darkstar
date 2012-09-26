---------------------------------------------
--  Quake Stomp
--
--  Description: Stomps the ground to boost next attack.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	local power = 1;
	local duration = 60;

	local typeEffect = EFFECT_BOOST;
	skill:setMsg(MSG_BUFF);
	if(mob:hasStatusEffect(typeEffect) == false) then
		local oldEffect = mob:getStatusEffect(typeEffect);
		oldEffect:setPower(power);
		oldEffect:setDuration(duration);
	else
		mob:addStatusEffect(typeEffect,power,0,duration);--tic=0;
		end
	return typeEffect;
end;
