-----------------------------------------
--	ID: 10963
--	Item: Arimid's Gorget
--	Enchantment: Reraise III
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	duration = 3600;
		target:delStatusEffect(EFFECT_RERAISE);
		target:addStatusEffect(EFFECT_RERAISE,3,0,duration);
end;