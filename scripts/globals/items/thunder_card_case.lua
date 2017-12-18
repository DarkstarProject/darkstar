-----------------------------------------
-- ID: 5406
-- Thunder Card Case
-- When used, you will obtain one stack of Thunder Cards
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(2180,99);
end;
