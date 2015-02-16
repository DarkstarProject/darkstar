-----------------------------------------
-- ID: 5945
-- Item: Pinch of Prize Powder
-- Effect: 60Min, Costume - Treasure Chest
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canUseCostume();
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_COSTUME,969,0,3600);
end;