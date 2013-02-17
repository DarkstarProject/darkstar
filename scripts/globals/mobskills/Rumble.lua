---------------------------------------------
--  Rumble
--
--  Description: A disorienting vibration lowers evasion of targets in an area of effect.
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
	local message = MSG_MISS;
	local typeEffect = EFFECT_EVASION_DOWN;
	local statmod = MOD_INT;
	local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_WIND);
	if(resist > 0.2) then
		message = MSG_ENFEEB_IS;
		target:delStatusEffect(typeEffect);
		target:addStatusEffect(typeEffect,50,0,120*resist);
	end
	skill:setMsg(message);
	return typeEffect;
end;
