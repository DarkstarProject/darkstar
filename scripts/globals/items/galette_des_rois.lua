-----------------------------------------
-- ID: 5875
-- Item: Galette Des Rois
-- Food Effect: 180 Min, All Races
-----------------------------------------
-- HP +8
-- MP +3% (cap13)
-- Intelligence +2
-- Random Jewel
-----------------------------------------

require("scripts/globals/status");
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effect.FOOD)) then
        result = 246;
    end
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5875);
    local rand = math.random(784,815);
    target:addItem(rand); -- Random Jewel
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 8);
    target:addMod(dsp.mod.FOOD_MPP, 3);
    target:addMod(dsp.mod.FOOD_MP_CAP, 13);
    target:addMod(dsp.mod.INT, 2);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 8);
    target:delMod(dsp.mod.FOOD_MPP, 3);
    target:delMod(dsp.mod.FOOD_MP_CAP, 13);
    target:delMod(dsp.mod.INT, 2);
end;
