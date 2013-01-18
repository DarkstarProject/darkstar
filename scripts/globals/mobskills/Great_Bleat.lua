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
	if(target:hasStatusEffect(typeEffect) == false) then
			local statmod = MOD_INT;
			local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,8);
			if(resist > 0.2) then
				skill:setMsg(MSG_ENFEEB_IS);
				target:addStatusEffect(typeEffect,30,0,60);
			else
				skill:setMsg(MSG_MISS);
			end
	else
		skill:setMsg(MSG_NO_EFFECT);
	end
	return typeEffect;
end;
