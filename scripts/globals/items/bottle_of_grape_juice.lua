-----------------------------------------
-- ID: 4441
-- Item: Grape Juice
-- Item Effect: Restores 60 MP over 90 seconds.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT_REFRESH)) then
        target:addStatusEffect(EFFECT_REFRESH,2,3,90);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
