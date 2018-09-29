-----------------------------------------
-- ID: 15957
-- Iron Musketeer's Quiver
-- When used, you will obtain one Iron Musketeer's Bolt
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(18739);
end;