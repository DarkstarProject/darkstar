-----------------------------------------
--	ID: 18913
--	Ark Sword
--	Enchantment: 60Min, Costume - Ark Angel EV
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
	target:addStatusEffect(EFFECT_COSTUME,785,0,3600);
end;