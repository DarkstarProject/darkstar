-----------------------------------------
-- ID: 5604
-- Item: Elshimo Pachira Fruit
-- Item Effect:  Poison 1HP / Removes 40 HP over 120 seconds
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT_POISON)) then
        target:addStatusEffect(EFFECT_POISON,1,3,120);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
