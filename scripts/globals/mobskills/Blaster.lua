---------------------------------------------
--  Blaster
--
--  Description: Paralyzes enemy.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows.
--  Range: Melee?
--  Notes: Very potent paralysis effect. Is NOT a Gaze Attack, unlike Chaotic Eye.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	local message = MSG_MISS;
	local typeEffect = EFFECT_PARALYSIS;
	if(target:hasStatusEffect(typeEffect) == false) then
		local accrand = math.random(1,2);
		if(accrand == 1) then
			local statmod = MOD_INT;
			local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,5);
			if(resist > 0.5) then
				message = MSG_ENFEEB_IS;
				target:addStatusEffect(typeEffect,50,0,60);--power=50;tic=0;duration=60;
			end
		end
	else
		message = MSG_NO_EFFECT;
	end
	skill:setMsg(message);
	return typeEffect;
end;
