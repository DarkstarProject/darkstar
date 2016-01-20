-----------------------------------------
--    ID: 5821
--    Fusion Bolt Quiver
--    When used, you will obtain one stack of Fusion Bolts
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
    target:addItem(19197,99);
end;