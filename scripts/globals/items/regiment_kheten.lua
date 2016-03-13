-----------------------------------------
-- ID: 18493
-- Item: Regiment Kheten
-- Item Effect: TP +10
-- Durration: Instant
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
    target:addTP(100);
end;
