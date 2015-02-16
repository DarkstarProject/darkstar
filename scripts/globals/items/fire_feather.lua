-----------------------------------------
-- ID: 5256
-- Item: Fire Feather
-- Effect: Enfire
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	if(target:addStatusEffect(EFFECT_ENFIRE,25,0,90)) then
		target:messageBasic(205);
	else
        	target:messageBasic(423); -- no effect
        end
end;