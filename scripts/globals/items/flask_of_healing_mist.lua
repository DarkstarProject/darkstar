-----------------------------------------
-- ID: 5832
-- Item: Flask of Healing Mist
-- Item Effect: Restores 600 HP AoE 10' radius
-----------------------------------------

-- TODO: Make AoE

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
	mHP = target:getMaxHP();
	cHP = target:getHP();
	if (mHP == cHP) then
		result = 56; -- Does not let player use item if their hp is full
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
	target:messageBasic(25,0,target:addHP(600));
	
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