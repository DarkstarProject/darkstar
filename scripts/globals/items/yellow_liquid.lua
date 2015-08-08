-----------------------------------------
--  ID: 5264
--  Item: Yellow Liquid
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	
	local result = 0;
	
	if (target:hasStatusEffect(EFFECT_FOOD)) then
		result = 246;
	end
	
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,30,5264);
end;