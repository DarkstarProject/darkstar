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

		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,EFFECT_AMNESIA,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_WIND);
		if(resist > 0.2) then
			message = MSG_ENFEEB_IS;
			target:addStatusEffect(typeEffect,1,0,30*resist); --power=1;tic=0;duration=30;
		else
			message = MSG_MISS;
		end
	else
		message = MSG_NO_EFFECT;
	end
	skill:setMsg(message);
	return typeEffect;
end;
