-----------------------------------------
-- ID: 4301
-- Item: Pear au Lait
-- Item Effect: Restores 300 HP over 300 seconds
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effects.REGEN)) then
        target:addStatusEffect(dsp.effects.REGEN,3,3,300);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
