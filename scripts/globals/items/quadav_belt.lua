-----------------------------------------
--	ID: 10848
--	Quadav Belt
--	Enchantment: 60Min, Costume - Quadav
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
	target:addStatusEffect(EFFECT_COSTUME,644,0,3600);
end;