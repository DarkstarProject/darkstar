-----------------------------------------
-- ID: 5340
-- Silver Bullet Pouch
-- When used, you will obtain one stack of Silver Bullets
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(17341,99);
end;