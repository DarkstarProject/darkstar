-----------------------------------------
-- ID: 11002
-- Dragon Tank
-- Dispense: Dragon Fruit au Lait
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(5933,1);
end;
