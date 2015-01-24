-----------------------------------------
--	ID: 18912
--	Ark Saber
--	Enchantment: 60Min, Costume - Ark Angel HM
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
	target:addStatusEffect(EFFECT_COSTUME,784,0,3600);
end;