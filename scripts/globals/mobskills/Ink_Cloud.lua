---------------------------------------------
--  Ink Cloud
--
--  Description: Blinds nearby targets with ink.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown radial
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	local message = MSG_MISS;
	local typeEffect = EFFECT_BLINDNESS;
	if(target:hasStatusEffect(typeEffect) == false) then
		local accrand = math.random(1,4);
		if(accrand ~= 1) then
			local statmod = MOD_INT;
			local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,8);
			if(resist > 0.5) then
				message = MSG_ENFEEB_IS;
				target:addStatusEffect(typeEffect,12,0,60);--power=12;tic=0;duration=60;
			end
		end
	else
		message = MSG_NO_EFFECT;
	end
	skill:setMsg(message);
	return typeEffect;
end;
