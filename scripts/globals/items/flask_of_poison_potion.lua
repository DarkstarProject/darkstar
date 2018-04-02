-----------------------------------------
-- ID: 4157
-- Item: Poison Potion
-- Item Effect: Poison 1HP / Removes 60 HP over 180 seconds
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effects.POISON)) then
        target:addStatusEffect(dsp.effects.POISON,1,3,180);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
