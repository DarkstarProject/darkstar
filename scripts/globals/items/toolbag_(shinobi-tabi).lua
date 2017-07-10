-----------------------------------------
-- ID: 5319
-- Toolbag Shinobi-tabi
-- When used, you will obtain one stack of Shinobi-tabi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addItem(1194,99);
end;

