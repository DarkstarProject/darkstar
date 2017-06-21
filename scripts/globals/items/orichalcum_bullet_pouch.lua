-----------------------------------------
--    ID: 5914
--    Orichalcum Bullet Pouch
--    When used, you will obtain one stack of Orichalcum Bullets
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
    target:addItem(19802,99);
end;
