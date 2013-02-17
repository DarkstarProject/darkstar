---------------------------------------------
--  Great Bleat
--
--  Description: Lowers maximum HP of targets in an area of effect.
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
	local typeEffect = EFFECT_MAX_HP_DOWN;
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_LIGHT);
		if(resist > 0.2) then
			skill:setMsg(MSG_ENFEEB_IS);
			target:delStatusEffect(typeEffect);
			target:addStatusEffect(typeEffect,30,0,60*resist);
		else
			skill:setMsg(MSG_MISS);
		end
	return typeEffect;
end;
