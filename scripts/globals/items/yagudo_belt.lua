-----------------------------------------
--	ID: 10849
--	Yagudo Belt
--	Enchantment: 60Min, Costume - Yagudo
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
	target:addStatusEffect(EFFECT_COSTUME,1064,0,3600);
end;