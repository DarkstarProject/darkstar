-----------------------------------------
-- ID: 5285
-- Old Bullet Box +1
-- When used, you will obtain one partial stack of Antique Bullets +1
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    local quantity = math.random(99);
    target:addItem(17276,quantity);
end;
