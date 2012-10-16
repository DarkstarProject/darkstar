---------------------------------------------
--  Wind Wall
--
--  Description: Invokes a protective wind barrier for increased evasion.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: Very sharp evasion increase.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_EVASION_BOOST;
	if(mob:hasStatusEffect(typeEffect) == true) then
		skill:setMsg(MSG_NO_EFFECT);
	else
		mob:addStatusEffect(typeEffect,50,0,60);--power=50;tic=0;duration=60;
		skill:setMsg(MSG_BUFF);
	end
	return typeEffect;
end;
