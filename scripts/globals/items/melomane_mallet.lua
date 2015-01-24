-----------------------------------------
--	ID: 18881
--	Melomane Mallet
--	Enchantment: Costume - Lycopodium
--	Durration: 60 Mins
-----------------------------------------

require("scripts/globals/settings");
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
	target:addStatusEffect(EFFECT_COSTUME,2247,0,3600);
end;