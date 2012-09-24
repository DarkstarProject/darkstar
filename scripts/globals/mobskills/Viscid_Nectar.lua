---------------------------------------------
--  Viscid Nectar
--
--  Description: Sprays a sticky nectar in a fan-shaped area, inflicting slow.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes: Slow is equivalent to Slow II.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_SLOW;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
		if(resist > 0.5) then
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(typeEffect,2,0,120);--power=2;tic=0;duration=120;
		else
			skill:setMsg(MSG_MISS);
		end
	else
		skill:setMsg(MSG_NO_EFFECT);
	end
	return typeEffect;
end;
