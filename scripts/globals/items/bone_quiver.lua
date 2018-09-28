-----------------------------------------
-- ID: 4220
-- Item: Bone Quiver
-- When used, you will obtain one stack of Bone Arrows
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(17319,99);
end;