-----------------------------------------
-- ID: 5362
-- Rainbow Powder
-- When applied, it makes things invisible.
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
    target:delStatusEffect(EFFECT_INVISIBLE);
    target:addStatusEffect(EFFECT_INVISIBLE,0,10,180);
    target:addStatusEffect(EFFECT_MEDICINE,0,0,180);
end;
