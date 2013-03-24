-----------------------------------------
-- ID: 4198
-- Item: Page from the Dragon Chronicles
-- Grants 500 - 1,000 EXP
-- Does not grant Limit Points. 
--
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
	target:addExp(EXP_RATE * math.random(500,1000));
end;
