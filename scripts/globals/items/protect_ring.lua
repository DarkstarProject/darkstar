-----------------------------------------
-- ID: 15838
-- Item: Protect Ring
-- Item Effect: Protect II
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (target:addStatusEffect(EFFECT_PROTECT, 40, 0, 1800)) then
        target:messageBasic(msgBasic.GAINS_EFFECT_OF_STATUS, EFFECT_PROTECT);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
