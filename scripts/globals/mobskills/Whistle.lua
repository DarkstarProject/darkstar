---------------------------------------------
--  Whistle
--
--  Description: Increases agility.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: When used by the Nightmare Dhalmel in Dynamis - Buburimu, it grants an Evasion Boost instead.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	local power = mob:getMainLvl()/10 * 3.75 + 5;
	local duration = 60;

	local typeEffect = EFFECT_AGI_BOOST;
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
