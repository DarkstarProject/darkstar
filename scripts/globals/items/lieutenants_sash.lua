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
    target:delStatusEffect(dsp.effects.FOOD);
    target:delStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD);
end;