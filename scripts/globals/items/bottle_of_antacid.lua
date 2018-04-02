-----------------------------------------
-- ID: 4153
-- Item: Antacid
-- Item Effect: This medicine helps remove meal effects.
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (target:hasStatusEffect(EFFECT.FOOD) == true) then
        target:delStatusEffect(EFFECT.FOOD);
    elseif (target:hasStatusEffect(EFFECT.FIELD_SUPPORT_FOOD) == true) then
        target:delStatusEffect(EFFECT.FIELD_SUPPORT_FOOD);
    end
end;