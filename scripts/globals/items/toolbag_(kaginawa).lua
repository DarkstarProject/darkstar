-----------------------------------------
-- ID: 5316
-- Toolbag Kagi
-- When used, you will obtain one stack of kaginawa
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
    target:addItem(1185,99);
end;

