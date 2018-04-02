-----------------------------------------
-- ID: 14515
-- Item: Hydra Doublet
-- Item Effect: gives refresh
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (target:hasStatusEffect(EFFECT.REFRESH)) then
        target:messageBasic(msgBasic.NO_EFFECT);
    else
        target:addStatusEffect(EFFECT.REFRESH, 4, 3, 180);
    end
end;
