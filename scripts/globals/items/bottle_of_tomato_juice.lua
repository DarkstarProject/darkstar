-----------------------------------------
-- ID: 4425
-- Item: Tomato Juice
-- Item Effect: Restores 60 MP over 180 seconds.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT_REFRESH)) then
        target:addStatusEffect(EFFECT_REFRESH,1,3,180);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
