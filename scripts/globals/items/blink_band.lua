-----------------------------------------
-- ID: 15170
-- Item: Blink Band
-- Item Effect: 3 shadows
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

    if (target:hasStatusEffect(EFFECT_COPY_IMAGE) or target:hasStatusEffect(EFFECT_THIRD_EYE)) then
        target:messageBasic(423);
    else
        target:addStatusEffect(EFFECT_BLINK, 3, 0, 300);
    end
end;