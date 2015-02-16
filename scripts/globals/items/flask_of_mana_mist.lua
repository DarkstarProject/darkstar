-----------------------------------------
-- ID: 5833
-- Item: Flask of Mana Mist
-- Item Effect: Restores 300 MP AoE 10' radius
-----------------------------------------

-- TODO: Make AoE

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
	mMP = target:getMaxMP();
	cMP = target:getMP();
	if (mHP == cHP) then
		result = 56; -- Does not let player use item if their mp is full
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
	target:addStatusEffect(EFFECT_MEDICINE,0,0,180);
	target:messageBasic(25,0,target:addMP(300));
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