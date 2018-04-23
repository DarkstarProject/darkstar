-----------------------------------------
-- ID: 5255
-- Item: Hermes Quencher
-- Item Effect: Flee for 30 seconds
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    if (target:hasStatusEffect(dsp.effects.MEDICINE)) then
        return msgBasic.ITEM_NO_USE_MEDICATED;
    end
    return 0;
end;

function onItemUse(target)
    target:delStatusEffect(dsp.effects.FLEE);
    target:addStatusEffect(dsp.effects.FLEE, 100, 0, 30);
    target:messageBasic(msgBasic.GAINS_EFFECT_OF_STATUS, dsp.effects.FLEE);
    target:addStatusEffect(dsp.effects.MEDICINE,0,0,900);
end;
