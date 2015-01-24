-----------------------------------------
--	ID: 11500
--	Chocobo Beret
--	Enchantment: 60Min, Costume - Blue adolescent chocobo (INCOMPLETE)
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
	target:addStatusEffect(EFFECT_COSTUME,(math.random(1996,2002)),0,3600);
end;