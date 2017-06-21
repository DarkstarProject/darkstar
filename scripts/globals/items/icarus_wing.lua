-----------------------------------------
--    ID: 4213
--    Icarus Wing
--    Increases TP of the user by 100
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_MEDICINE) == true) then
        result = 111;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addTP(1000);
    target:addStatusEffect(EFFECT_MEDICINE,0,0,7200);
end;