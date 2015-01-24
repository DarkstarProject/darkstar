-----------------------------------------
--	ID: 10852
--	Hecteyes Belt
--	Enchantment: 60Min, Costume - Hecteyes
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
	target:addStatusEffect(EFFECT_COSTUME,384,0,3600);
end;