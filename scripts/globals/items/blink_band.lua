-----------------------------------------
-- ID: 15170
-- Item: Blink Band
-- Item Effect: 3 shadows
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (target:hasStatusEffect(EFFECT_COPY_IMAGE) or target:hasStatusEffect(EFFECT_THIRD_EYE)) then
        target:messageBasic(msgBasic.NO_EFFECT);
    else
        target:addStatusEffect(EFFECT_BLINK, 3, 0, 300);
        target:messageBasic(msgBasic.GAINS_EFFECT_OF_STATUS, EFFECT_BLINK);
    end
end;
