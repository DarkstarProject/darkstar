-----------------------------------------
-- ID: 4153
-- Item: Antacid
-- Item Effect: This medicine helps remove meal effects.
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effect.FOOD) == true) then
        target:delStatusEffect(dsp.effect.FOOD)
    elseif (target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        target:delStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD)
    end
end