---------------------------------------------
--  Harden Shell
--
--  Description: Enhances defense.
--  Type: Magical (Earth)
--  
--  
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_DEFENSE_BOOST;
	if(mob:hasStatusEffect(typeEffect) == true) then
		skill:setMsg(MSG_NO_EFFECT);
	else
		mob:addStatusEffect(typeEffect,100,0,60);--power=100;tic=0;duration=60;
		skill:setMsg(MSG_BUFF);
	end
	return typeEffect;
end;
