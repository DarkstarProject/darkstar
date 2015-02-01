-----------------------------------------
--	ID: 15459
--	Item: Sagacious Gold Obi
--	INT+3
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
	
	if (target:hasStatusEffect(EFFECT_INT_BOOST) == true) then
		result = 56;
	end
	
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_INT_BOOST,3,0,3000,15459);
end;