-----------------------------------------
-- Sleepga
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnPetAbility(target, pet, skill)
	duration = 60;
	resm = applyPlayerResistance(pet,skill,target,pet:getMod(MOD_INT)-target:getMod(MOD_INT),ELEMENTAL_MAGIC_SKILL, 5);
	if(resm < 0.5) then
		skill:setMsg(MSG_RESIST);--resist message
		return EFFECT_SLEEP_I;
	end
	duration = duration * resm;
	if(target:hasImmunity(1) or target:hasStatusEffect(EFFECT_SLEEP_II) or target:hasStatusEffect(EFFECT_SLEEP_I)) then
		--No effect
		skill:setMsg(MSG_NO_EFFECT);
	else
		skill:setMsg(MSG_ENFEEB);
		
		target:addStatusEffect(EFFECT_SLEEP_I,1,0,duration);
	end
	
	return EFFECT_SLEEP_I;
end;