-----------------------------------------
-- ID: 5575
-- Item: Yogurt
-- Item Effect: Restores 60 HP over 180 seconds
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT_REGEN)) then
        target:addStatusEffect(EFFECT_REGEN,1,3,180);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
