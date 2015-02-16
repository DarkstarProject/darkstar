-----------------------------------------
-- ID: 5837
-- Item: Tube of Clear Salve I
-- Item Effect: Removes most status ailments from Pet
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
	if (target:getObjType() ~= TYPE_PET)
		result = 56;
	end
	if (target:hasStatusEffect(EFFECT_MEDICINE)) then
		result = 111;
	end	
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local effect = target:eraseStatusEffect();
	if(effect == EFFECT_NONE) then
		target:messageBasic(423); -- no effect
	else
		target:eraseStatusEffect();
	end
	target:addStatusEffect(EFFECT_MEDICINE,0,0,180);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
end;
