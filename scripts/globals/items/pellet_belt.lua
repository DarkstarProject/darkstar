-----------------------------------------
--      ID: 15288
--      Pellet Belt
--      When used, you will obtain 12 Pebbles
-----------------------------------------

-----------------------------------------
--      OnItemCheck
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
    target:addItem(17296,12);
end;
