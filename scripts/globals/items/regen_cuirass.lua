-----------------------------------------
-- ID: 15170
-- Item: regen cuirass
-- Item Effect: gives regen
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (target:hasStatusEffect(EFFECT_REGEN)) then
        target:messageBasic(msgBasic.NO_EFFECT);
    else
        target:addStatusEffect(EFFECT_REGEN, 15, 3, 180);
    end
end;
