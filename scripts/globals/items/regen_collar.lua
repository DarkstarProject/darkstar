-----------------------------------------
-- ID: 15526
-- Item: Regen Collar
-- Item Effect: Restores 40 HP over 120 seconds
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT_REGEN)) then
        target:addStatusEffect(EFFECT_REGEN,1,3,120);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
