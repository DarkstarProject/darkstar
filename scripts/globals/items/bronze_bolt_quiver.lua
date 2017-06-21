-----------------------------------------
--    ID: 4227
--    Item: Bronze Bolt Quiver
--    When used, you will obtain one stack of Bronze Bolts
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
    target:addItem(17339,99);
end;