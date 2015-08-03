-----------------------------------------
-- ID: 5932
-- Item: Bottle of Kitron Juice
-- Item Effect: Restores 180 MP over 180 seconds.
-----------------------------------------

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
	if (target:hasStatusEffect(EFFECT_REFRESH) == false) then
		target:addStatusEffect(EFFECT_REFRESH,3,3,180);
	else
		target:messageBasic(423);
	end
end;

