-----------------------------------------
-- ID: 4208
-- Item: Bottle of Catholicon +1
-- Item Effect: Removes up to 7 negative status effects
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
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
		local z = 0;
		while z <= 7 do
			target:eraseStatusEffect();
			if(effect == EFFECT_NONE) then
				z = 7;
			end
		z = z + 1;
		end;
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