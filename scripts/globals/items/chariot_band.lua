-----------------------------------------
-- ID: 15761
-- Item: Chariot Band
-----------------------------------------
-- ID: 15761
-- Item: chariot band
-- Experience point bonus
-----------------------------------------
-- Bonus: +75%
-- Duration: 720 min
-- Max bonus: 750 exp
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.DEDICATION) == true) then
        result = 56
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.DEDICATION,75,0,5400,0,500)
end