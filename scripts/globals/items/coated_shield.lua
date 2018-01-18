-----------------------------------------
-- ID: 15838
-- Item: Coated Shield
-- Item Effect: Shell
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (target:addStatusEffect(EFFECT_SHELL, 9, 0, 1800)) then
        target:messageBasic(msgBasic.GAINS_EFFECT_OF_STATUS, EFFECT_SHELL);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
