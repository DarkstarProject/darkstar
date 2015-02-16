-----------------------------------------
-- ID: 5396
-- Item: Bottle of Shepherd's Drink
-- Item Effect: Restor Pet's HP
-----------------------------------------

--TODO: Make AoE

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	pet = target:getPet();
	result = 0;
	if (pet:hasStatusEffect(EFFECT_MEDICINE)) then
		result = 111;
	end
	mHP = pet:getMaxHP();
	cHP = pet:getHP();

	if (mHP == cHP) then
		value = 56; -- Does not let player use item if their pet's hp is full
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local rHP = mHP - cHP;
	pet:addStatusEffect(EFFECT_MEDICINE,0,0,180);
	pet:addHP(rHP);
	target:messageBasic(24,0,rHP);
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