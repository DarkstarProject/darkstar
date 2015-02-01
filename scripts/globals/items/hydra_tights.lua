-----------------------------------------
--	ID: 15596
--	Item: Hydra Tights
--	Enchantment: Haste
--	Duration: 3 Mins
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
	if(target:addStatusEffect(EFFECT_HASTE, 102, 0, 180)) then
	        target:messageBasic(205);
	else
	        target:messageBasic(423); -- no effect
	end
end;