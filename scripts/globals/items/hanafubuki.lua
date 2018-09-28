-----------------------------------------
-- ID: 18427
-- Item: Hanafubuki
-- Item Effect: TP +10
-- Durration: Instant
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    return result;
end;

function onItemUse(target)
    target:addTP(100);
end;
