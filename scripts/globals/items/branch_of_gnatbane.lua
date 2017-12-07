-----------------------------------------
-- ID: 5984
-- Item: Branch of Gnatbane
-- Food Effect: 10 Mins, All Races
-- Poison 10HP / 3Tic
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    if (target:hasStatusEffect(EFFECT_FOOD) or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD)) then
        return msgBasic.IS_FULL;
    end
    return 0;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,600,5984);
    if (not target:hasStatusEffect(EFFECT_POISON)) then
        target:addStatusEffect(EFFECT_POISON,10,3,600);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
