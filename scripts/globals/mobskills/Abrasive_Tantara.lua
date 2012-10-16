---------------------------------------------
--  Abrasive Tantara
--
--  Description: Inflicts amnesia in an area of effect
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' as well as single target outside of 10'
--  Notes: Doesn't use this if its horn is broken.  It is possible for Abrasive Tantara to miss. - See discussion
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
	local typeEffect = EFFECT_AMNESIA;
	if(target:hasStatusEffect(typeEffect) == false) then
		local accrand = math.random(1,6);
		if(accrand ~= 1) then
			local statmod = MOD_INT;
			local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,1);
			if(resist > 0.3) then
				message = MSG_ENFEEB_IS;
				target:addStatusEffect(typeEffect,1,0,30); --power=1;tic=0;duration=30;
			end
		end
	else
		message = MSG_NO_EFFECT;
	end
	skill:setMsg(message);
	return typeEffect;
end;
