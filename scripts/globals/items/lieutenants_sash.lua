-----------------------------------------
-- ID: 15912
-- Item: Lieutenant's Sash
-- On Use: Removes food effect.
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effects.FOOD) == true) then
        target:delStatusEffect(dsp.effects.FOOD);
    elseif (target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        target:delStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD);
    end
end;