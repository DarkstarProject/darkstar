-----------------------------------------
-- ID: 15753
-- Item: Dream Boots +1
-- Enchantment: Sneak
-- Duration: 3 Mins 20 Secs
-- TODO: Enhances duration of Sneak Effect
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
	local duration = 200;
	-- duration = duration + (duration * target:getMod(MOD_SNEAK_DUR));
	-- MOD_SNEAK_DUR needed to be created in modifier.h AND in status.lua or you crash the server!
	if (not target:hasStatusEffect(EFFECT_SNEAK)) then
		target:addStatusEffect(EFFECT_SNEAK,1,10,duration * SNEAK_INVIS_DURATION_MULTIPLIER);
	end
end;
