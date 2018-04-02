-----------------------------------------
-- ID: 5984
-- Item: Branch of Gnatbane
-- Food Effect: 10 Mins, All Races
-- Poison 10HP / 3Tic
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    if (target:hasStatusEffect(dsp.effects.FOOD) or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD)) then
        return msgBasic.IS_FULL;
    end
    return 0;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,600,5984);
    if (not target:hasStatusEffect(dsp.effects.POISON)) then
        target:addStatusEffect(dsp.effects.POISON,10,3,600);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
