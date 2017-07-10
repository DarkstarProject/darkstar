-----------------------------------------
-- ID: 5867
-- Toolbag Ino
-- When used, you will obtain one stack of inoshishinofuda
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
    target:addItem(2971,99);
end;

