-----------------------------------------
-- ID: 4157
-- Item: Poison Potion
-- Item Effect: Removes 60 HP over 180 seconds
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
    target:resetRecasts();
end;

