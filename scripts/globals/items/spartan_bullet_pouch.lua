-----------------------------------------
-- ID: 5341
-- Spartan Bullet Pouch
-- When used, you will obtain one stack of Spartan Bullets
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(18160,99);
end;