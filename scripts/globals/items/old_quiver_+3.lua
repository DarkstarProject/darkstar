-----------------------------------------
--    ID: 5273
--    Old Quiver +3
--    When used, you will obtain one partial stack of Crude Arrows +3
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
    local quantity = math.random(99);
    quantity = math.random(99);
    quantity = math.random(99);
    target:addItem(18184,quantity);
end;