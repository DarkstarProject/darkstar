---------------------------------------------
--  Mortal Ray
--
--  Description: Inflicts Doom upon an enemy.
--  Type: Magical (Dark)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_DOOM;
	if(target:hasStatusEffect(typeEffect) == false and target:isFacing(mob)) then
		skill:setMsg(MSG_ENFEEB_IS);
		target:addStatusEffect(typeEffect,10,3,30*resist);--power=1;tic=0;duration=60
	else
		skill:setMsg(MSG_NO_EFFECT);
	end
	return typeEffect;
end;
