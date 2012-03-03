-----------------------------------------
-- ID: 4558
-- Item: Yagudo Drink
-- Item Effect: Restores 120 MP over 3 minutes
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
	
	if(target:getStatusEffect(EFFECT_REFRESH)== nil) then
        target:addStatusEffect(EFFECT_REFRESH,2,3,180);
	end
	if(target:getStatusEffect(EFFECT_REFRESH) < 3) then
		target:delStatusEffect(EFFECT_REFRESH);
	    target:addStatusEffect(EFFECT_REFRESH,2,3,180);
	end
end;

