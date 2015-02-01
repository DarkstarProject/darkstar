-----------------------------------------
--	ID: 18545
--	Ark Tabar
--	Enchantment: 60Min, Costume - Ark Angel MR
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
	target:addStatusEffect(EFFECT_COSTUME,786,0,3600);
end;