-----------------------------------------
-- ID: 18755
-- Item: Noble Himantes
-- Item Effect: TP +10
-- Durration: Instant
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    result = 0;
    return result;
end;

function onItemUse(target)
    target:addTP(100);
end;
