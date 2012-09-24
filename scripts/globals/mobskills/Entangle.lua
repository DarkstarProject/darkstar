---------------------------------------------
--  Entangle
--
--  Description: Attempts to bind a single target with vines.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Melee
--  Notes: When used by the Cemetery Cherry and Jidra, it also deals damage, inflicts Poison, and resets hate. When used by Cernunnos, also drains HP equal to the damage inflicted.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	local message = MSG_MISS;
	local typeEffect = EFFECT_BIND;
	if(target:hasStatusEffect(typeEffect) == true) then
		local accrand = math.random(1,2);
		if(accrand == 1) then
			local statmod = MOD_INT;
			local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,5);
			if(resist > 0.5) then
				message = MSG_ENFEEB_IS;
				target:addStatusEffect(typeEffect,1,0,30);--power=1;tic=0;duration=30;
			end
		end
	else
		message = MSG_NO_EFFECT;
	end
	skill:setMsg(message);
	return typeEffect;
end;
