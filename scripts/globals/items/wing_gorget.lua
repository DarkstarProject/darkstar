-----------------------------------------
-- ID: 15170
-- Item: wing gorget
-- Item Effect: gives regain
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (target:hasStatusEffect(EFFECT_REGAIN)) then
        target:messageBasic(msgBasic.NO_EFFECT);
    else
        target:addStatusEffect(EFFECT_REGAIN, 5, 3, 30);
    end
end;
