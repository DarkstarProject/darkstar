-----------------------------------------
-- ID: 16249
-- Elixir Tank
-- When used, you will obtain one Elixir
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(4145,1);
end;