-----------------------------------------
-- ID: 5312
-- Toolbag Hira
-- When used, you will obtain one stack of hiraishin
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
    target:addItem(1173,99);
end;

