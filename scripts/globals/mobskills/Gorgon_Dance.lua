---------------------------------------------
--  Gorgon Dance
--
--  Description: Petrifies all targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' radial?
--  Notes: Used only by Medusa. Starts using it at 25%.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_PETRIFICATION;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
		if(resist > 0.5) then
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(typeEffect,1,0,60);--power=1;tic=0;duration=60;
		else
			skill:setMsg(MSG_MISS);
		end
	else
		skill:setMsg(MSG_NO_EFFECT);
	end
	return typeEffect;
end;
