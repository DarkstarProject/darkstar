-----------------------------------------
-- ID: 11275
-- Item: magna gilet +1
-- Teleport's user to Purgonorgo Isle
-----------------------------------------

require("scripts/globals/teleports")

function onItemCheck(target)
    local result = 0
    if (target:isZoneVisited(4) == false) then
        result = 56
    end
    return result
end

function onItemUse(target)
    dsp.teleport.to(target, dsp.teleport.id.PURGONORGO)
end