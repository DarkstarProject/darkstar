-----------------------------------------
-- ID: 6300
-- Item: Koga Shr. Pouch
-- When used, you will obtain one stack of Koga Shurikens
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(18712,99);
end;
