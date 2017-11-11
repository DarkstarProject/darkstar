-----------------------------------------
-- ID: 15838
-- Item: Protect Earring
-- Item Effect: Protect
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (target:addStatusEffect(EFFECT_PROTECT, 15, 0, 1800)) then
        target:messageBasic(msgBasic.GAINS_EFFECT_OF_STATUS, EFFECT_PROTECT);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
