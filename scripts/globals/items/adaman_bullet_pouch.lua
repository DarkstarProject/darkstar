-----------------------------------------
-- ID: 5915
-- Adaman Bullet Pouch
-- When used, you will obtain one stack of Adaman Bullets
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(19803,99);
end;
