-----------------------------------------
-- ID: 5336
-- Holy Bolt Quiver
-- When used, you will obtain one stack of Holy Bolts
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(18153,99);
end;