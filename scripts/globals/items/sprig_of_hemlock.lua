-----------------------------------------
-- ID: 5985
-- Item: Sprig of Hemlock
-- Food Effect: 5 Min, All Races
-- Paralysis
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT_PARALYSIS)) then
        target:addStatusEffect(EFFECT_PARALYSIS,20,0,600);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
