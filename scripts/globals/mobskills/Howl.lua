---------------------------------------------
--  Howl
--
--  Description: Grants the effect of Warcry to user and any linked allies.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self and nearby mobs of same family and/or force up to 20'.
-----------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	if(target:isInDynamis()) then
		return 1;
	end
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local power = 25;
	local duration = 180;

	local typeEffect = EFFECT_WARCRY;
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
