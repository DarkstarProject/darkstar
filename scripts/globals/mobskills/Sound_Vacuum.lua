---------------------------------------------
--  Sound Vacuum
--
--  Description: Silences opponents in a fan-shaped area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes: Worm version is single target rather than conical (except for Nightmare Worm). The Nightmare Cockatrice inflicts Mute with this ability.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	local message = MSG_MISS;
	local typeEffect = EFFECT_SILENCE;
	if(target:hasStatusEffect(typeEffect) == false) then
		local accrand = math.random(1,3);
		if(accrand == 1) then
			local statmod = MOD_INT;
			local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,4);
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
