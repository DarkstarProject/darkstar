-----------------------------------------
-- ID: 4424
-- Item: Melon Juice
-- Item Effect: Restores 90 MP over 135 seconds.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT_REFRESH)) then
        target:addStatusEffect(EFFECT_REFRESH,2,3,135);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
