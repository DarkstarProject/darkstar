-----------------------------------------
--	ID: 18400
--	Item : Charm Wand +1
--  	This earring functions in the same way as the spell Reraise III.
--	Durration: 1 Hr
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
	duration = 3600;
		target:delStatusEffect(EFFECT_RERAISE);
		target:addStatusEffect(EFFECT_RERAISE,3,0,duration);
end;
