-----------------------------------------
-- ID: 5703
-- Item: Uleguerand Milk
-- Item Effect: Restores 80 HP over 120 seconds
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT_REGEN)) then
        target:addStatusEffect(EFFECT_REGEN,2,3,120);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
