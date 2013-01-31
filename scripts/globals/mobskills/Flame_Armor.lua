---------------------------------------------
--  Flame Armor
--
--  Description: Covers the user in fiery spikes. Enemies that hit it take fire damage.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	-- blaze spikes not working atm
	return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
	local power = 50;
	local duration = 180;
	local typeEffect = EFFECT_BLAZE_SPIKES;
	skill:setMsg(MSG_BUFF);
	if(mob:hasStatusEffect(typeEffect) == true) then
		local oldEffect = mob:getStatusEffect(typeEffect);
		oldEffect:setPower(power);
		oldEffect:setDuration(duration);
	else
		mob:addStatusEffect(typeEffect,power,0,duration);
	end
	return typeEffect;
end;
