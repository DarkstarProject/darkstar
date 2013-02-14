---------------------------------------------
--  Hex Eye
--
--  Description: Paralyzes with a gaze.
--  Type: Gaze
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Line of sight
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
	local typeEffect = EFFECT_PARALYSIS;
	
	if(target:hasStatusEffect(typeEffect) == false and target:isFacing(mob)) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_ICE);
		if(resist > 0.2) then
			message = MSG_ENFEEB_IS;
			target:addStatusEffect(typeEffect,25,0,60*resist);
		end
	else
		message = MSG_NO_EFFECT;
	end
	
	skill:setMsg(message);
	return typeEffect;
	
end;