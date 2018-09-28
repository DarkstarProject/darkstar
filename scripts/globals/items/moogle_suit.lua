-----------------------------------------
-- ID: 10250
-- Moogle Suit
-- Dispense: Mog Missile
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(5936,1);
end;