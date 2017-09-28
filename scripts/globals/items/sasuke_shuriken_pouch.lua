-----------------------------------------
-- ID: 6447
-- Sasu. Sh. Pouch
-- A small leather pouch made for storing sasuke shuriken.
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
    target:addItem(22276,99);
end;

