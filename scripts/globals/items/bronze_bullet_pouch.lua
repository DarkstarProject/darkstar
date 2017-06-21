-----------------------------------------
--    ID: 5359
--    Item: Bronze Bullet Pouch
--    When used, you will obtain one stack of Bronze Bullets
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
    target:addItem(17343,99);
end;