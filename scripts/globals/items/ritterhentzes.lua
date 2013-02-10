-----------------------------------------
-- ID: 15652
-- Item: ritter
-- Item Effect: Blaze Spikes
-----------------------------------------

require("scripts/globals/settings");

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
    target:addStatusEffect(EFFECT_BLAZE_SPIKES, 20, 0, 210);
end;