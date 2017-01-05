-----------------------------------------
-- ID: 4153
-- Item: Antacid
-- Item Effect: This medicine helps remove meal effects.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    if (target:hasStatusEffect(EFFECT_FOOD) == true) then
        target:delStatusEffect(EFFECT_FOOD);
    elseif (target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        target:delStatusEffect(EFFECT_FIELD_SUPPORT_FOOD);
    end
end;