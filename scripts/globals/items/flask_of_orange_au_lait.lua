-----------------------------------------
-- ID: 4299
-- Item: Orange au Lait
-- Item Effect: Restores 100 HP over 300 seconds
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT_REGEN)) then
        target:addStatusEffect(EFFECT_REGEN,1,3,300);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
