-----------------------------------------
-- ID: 18444
-- Item: Tsurugitachi
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
    target:addTP(10);
end;
