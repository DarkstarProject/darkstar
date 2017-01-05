-----------------------------------------
-- ID: 15762
-- Item: empress band
-- Experience point bonus
-----------------------------------------
-- Bonus: +50%
-- Duration: 720 min
-- Max bonus: 15000 exp
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_DEDICATION) == true) then
        result = 56;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_DEDICATION,50,0,43200,0,15000);
end;
