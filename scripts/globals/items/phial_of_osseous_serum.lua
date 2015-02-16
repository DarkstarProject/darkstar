-----------------------------------------
-- ID: 5352
-- Phial of Osseous Serum
-- Enchantment: 60Min, Costume - Skeleton
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
	target:addStatusEffect(EFFECT_COSTUME,564,0,3600);
end;