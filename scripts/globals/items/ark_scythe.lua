-----------------------------------------
--	ID: 18563
--	Ark Scythe
--	Enchantment: 60Min, Costume - Ark Angel TT
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
	target:addStatusEffect(EFFECT_COSTUME,787,0,3600);
end;