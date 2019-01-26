-----------------------------------------
-- ID: 10270
-- River Top +1
-- Dispense: Berry Snowcone
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:getFreeSlotsCount() == 0) then
        result = 308
    end
    return result
end

function onItemUse(target)
    target:addItem(5710,1)
end