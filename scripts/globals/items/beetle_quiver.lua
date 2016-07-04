-----------------------------------------
--    ID: 4221
--    Item: Beetle Quiver
--    When used, you will obtain one stack of Beetle Arrows
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
    target:addItem(18154,99);
end;