-----------------------------------------
--    ID: 4106
--    Wind Cluster
--    Turn into a stack of wind crystals
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
    target:addItem(4098,12);
end;