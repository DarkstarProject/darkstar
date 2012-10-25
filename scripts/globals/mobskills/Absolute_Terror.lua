---------------------------------------------------
-- Absolute Terror
-- Causes Terror, which causes the victim to be stunned for the duration of the effect, this can not be removed. 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	if(applyPlayerResistance(mob,skill,target,true,EFFECT_TERROR,MOD_INT) > 0.5) then
		if(target:hasStatusEffect(EFFECT_TERROR) == false) then
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(EFFECT_TERROR,30,0,180); -- 30% ?
		else
			skill:setMsg(MSG_NO_EFFECT); -- no effect
		end
	else
		skill:setMsg(MSG_MISS); -- resist !
	end
	
	return EFFECT_TERROR;
	
end