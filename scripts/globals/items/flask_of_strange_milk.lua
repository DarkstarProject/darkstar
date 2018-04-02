-----------------------------------------
-- ID: 5437
-- Item: Flask of Strange Milk
-- Item Effect: Restores 500 HP over 300 seconds.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT.REGEN)) then
        target:addStatusEffect(EFFECT.REGEN,5,3,300);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
