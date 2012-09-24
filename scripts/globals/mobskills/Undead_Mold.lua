---------------------------------------------
--  Undead Mold
--
--  Description: Releases undead spores that diseases targets in front.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Front arc
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_DISEASE;
	if(target:hasStatusEffect(typeEffect) == false) then
		local accrand = math.random(1,2);
		if(accrand == 1) then
			local statmod = MOD_INT;
			local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,8);
			if(resist > 0.5) then
				skill:setMsg(MSG_ENFEEB_IS);
				target:addStatusEffect(typeEffect,1,0,120);--power=1;tic=0;duration=120;
			else
				skill:setMsg(MSG_MISS);
			end
		else
			skill:setMsg(MSG_MISS);
		end
	else
		skill:setMsg(MSG_NO_EFFECT);
	end
	return typeEffect;
end;
