-----------------------------------------
--	ID: 18464
--	Ark Tachi
--	Enchantment: 60Min, Costume - Ark Angel GK
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
	target:addStatusEffect(EFFECT_COSTUME,788,0,3600);
end;