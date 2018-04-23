-----------------------------------------
-- ID: 5742
-- Item: Bottle of Buffalo Bonanza Milk
-- Item Effect: Restores 120 HP over 60 seconds. 
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effects.REGEN)) then
        target:addStatusEffect(dsp.effects.REGEN,2,1,60);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
