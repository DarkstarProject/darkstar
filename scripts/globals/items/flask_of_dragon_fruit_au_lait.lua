-----------------------------------------
-- ID: 5933
-- Item: Flask of Dragon Fruit au Lait
-- Item Effect: Restores 600 HP over 300 seconds
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effects.REGEN)) then
        target:addStatusEffect(dsp.effects.REGEN,6,3,300);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
