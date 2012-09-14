---------------------------------------------
--  Baleful Gaze
--  Description: Petrifies opponents with a gaze attack.
--  Type: Gaze
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Single gaze
--  Notes: Nightmare Cockatrice extends this to a fan-shaped AOE.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_PETRIFICATION;
	statmod = MOD_INT;
	resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_PETRIFICATION) == nil) then
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(EFFECT_PETRIFICATION,1,0,180);
		else
			skill:setMsg(MSG_NO_EFFECT); -- no effect
		end
	else
		skill:setMsg(MSG_MISS); -- resist !
	end
	
	return EFFECT_PETRIFICATION;
	
end