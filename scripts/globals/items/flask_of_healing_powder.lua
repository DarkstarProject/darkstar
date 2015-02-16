-----------------------------------------
-- ID: 5322
-- Item: Flask of Healing Powder
-- Item Effect: Restores 25% MP AoE 10' radius
-----------------------------------------

-- TODO: Make AoE

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
	mMP = target:getMaxHP();
	cMP = target:getHP();
	rMP = mHP * .25;
	if (mHP == cHP) then
		result = 56; -- Does not let player use item if their HP is full
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
	target:messageBasic(25,0,target:addHP(rHP));
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