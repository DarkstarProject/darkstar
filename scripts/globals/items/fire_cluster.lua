-----------------------------------------
-- ID: 4104
-- Fire Cluster
-- Turn into a stack of fire crystals
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(4096,12);
end;