-----------------------------------------
--	ID: 18541
--	Item: Refresh Musk
--	Enchantment: Adds Refresh
--	Duration: 60 Secs
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

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
	local duration = 60;
	target:delStatusEffect(EFFECT_REFRESH);
	target:addStatusEffect(EFFECT_REFRESH,3,1,duration);
end;