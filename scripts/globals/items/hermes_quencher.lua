-----------------------------------------
-- ID: 5255
-- Item: Hermes Quencher
-- Item Effect: Flee for 30 seconds
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    if (target:hasStatusEffect(EFFECT_MEDICINE)) then
        return msgBasic.ITEM_NO_USE_MEDICATED;
    end
    return 0;
end;

function onItemUse(target)
    target:delStatusEffect(EFFECT_FLEE);
    target:addStatusEffect(EFFECT_FLEE, 100, 0, 30);
    target:messageBasic(msgBasic.GAINS_EFFECT_OF_STATUS, EFFECT_FLEE);
    target:addStatusEffect(EFFECT_MEDICINE,0,0,900);
end;
