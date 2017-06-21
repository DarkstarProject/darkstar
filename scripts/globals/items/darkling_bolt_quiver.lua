-----------------------------------------
--    ID: 5820
--    Darkling Bolt Quiver
--    When used, you will obtain one stack of Darkling Bolts
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
    target:addItem(19196,99);
end;