-----------------------------------------
-- ID: 5615
-- Item: uberkuchen
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- HP 10
-- MP % 3 (cap 15)
-- Intelligence 3
-- HP Recovered While Healing 2
-- MP Recovered While Healing 1
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,5615);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 10);
    target:addMod(MOD_FOOD_MPP, 3);
    target:addMod(MOD_FOOD_MP_CAP, 15);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 1);
    target:addMod(MOD_INT, 3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 10);
    target:delMod(MOD_FOOD_MPP, 3);
    target:delMod(MOD_FOOD_MP_CAP, 15);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 1);
    target:delMod(MOD_INT, 3);
end;
