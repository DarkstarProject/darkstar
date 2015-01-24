-----------------------------------------
-- ID: 18035
-- Item: Deathbone Knife
-- Item Effect: Restores 10 TP
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
	target:addTP(10);
end;