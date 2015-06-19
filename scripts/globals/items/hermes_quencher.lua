-----------------------------------------
-- ID: 5255
-- Item: Hermes Quencher
-- Item Effect: Flee for 30 seconds
-----------------------------------------

require("scripts/globals/settings");

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
    target:delStatusEffect(EFFECT_FLEE);
    target:addStatusEffect(EFFECT_FLEE, 100, 0, 30);
    target:messageBasic(266,0, EFFECT_FLEE);
    target:addStatusEffect(EFFECT_MEDICINE,0,0,900);
end;