-----------------------------------------
-- ID: 4110
-- Light Cluster
-- Turn into a stack of light crystals
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(4102,12);
end;