-----------------------------------------
-- ID: 6448
-- Sasu. Sh. Pouch +1
-- A small leather pouch made for storing sasuke shuriken +1.
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
    target:addItem(22277,99);
end;

