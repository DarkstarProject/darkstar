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
	if(target:hasStatusEffect(typeEffect) == false) then
		local accrand = math.random(1,4);
		if(accrand ~= 1) then
			local statmod = MOD_INT;
			local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
			if(resist > 0.3) then
				message = MSG_ENFEEB_IS;
				target:addStatusEffect(typeEffect,50,0,120);
			end
		end
	else
		message = MSG_NO_EFFECT;
	end
	skill:setMsg(message);
	return typeEffect;
end;
