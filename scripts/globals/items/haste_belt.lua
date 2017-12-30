-----------------------------------------
-- ID: 15290
-- Item: Haste Belt
-- Item Effect: 10% haste
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT_HASTE)) then
        target:addStatusEffect(EFFECT_HASTE,102,0,180);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
