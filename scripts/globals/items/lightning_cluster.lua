-----------------------------------------
-- ID: 4108
-- Lighting Cluster
-- Turn into a stack of lighting crystals
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(4100,12);
end;