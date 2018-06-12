-----------------------------------------
-- ID: 5984
-- Item: Branch of Gnatbane
-- Food Effect: 10 Mins, All Races
-- Poison 10HP / 3Tic
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    if (target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD)) then
        return dsp.msg.basic.IS_FULL;
    end
    return 0;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,600,5984);
    if (not target:hasStatusEffect(dsp.effect.POISON)) then
        target:addStatusEffect(dsp.effect.POISON,10,3,600);
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT);
    end
end;
