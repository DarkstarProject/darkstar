-----------------------------------------
--  ID: 13683
--  Water Tank
--  When used, you will obtain one stack of Distilled Water
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(4509,12);
end;