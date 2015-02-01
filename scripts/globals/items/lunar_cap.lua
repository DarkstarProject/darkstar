-----------------------------------------
--	ID: 16145
--	Item: Lunar Cap
--	Enchantment: Adds Regen
--	Duration: 60 Mins
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck  -- TODO check for party member with Sol Cap
-----------------------------------------

function onItemCheck(target)
	return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	duration = 3600;
		target:delStatusEffect(EFFECT_REGEN;
		target:addStatusEffect(EFFECT_REGEN,1,1,duration);
end;