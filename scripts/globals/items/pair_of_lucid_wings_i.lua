-----------------------------------------
--	ID: 5834
--	Pair of Lucid Wings I
--	Increases TP of the user by 50%
-----------------------------------------

-- TODO: Make AoE

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
	mTP = target:getMaxTP();
	cTP = target:getTP();
	if (mTP == cTP) then
		result = 56; -- Does not let player use item if their TP is full
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
	target:addTP((cTP * .5);
end;