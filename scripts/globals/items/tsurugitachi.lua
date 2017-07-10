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
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addTP(100);
end;
