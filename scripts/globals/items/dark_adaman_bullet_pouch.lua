-----------------------------------------
-- ID: 5873
-- Dark Adaman Bullet Pouch
-- When used, you will obtain one stack of Dark Adaman Bullets
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(19184,99);
end;
