-----------------------------------------
-- ID: 4554
-- Item: serving_of_shallops_tropicale
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Magic 20
-- Dexterity 1
-- Vitality 4
-- Intelligence 1
-- Defense % 25
-- Defense Cap 100
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4554);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_MP, 20);
    target:addMod(MOD_DEX, 1);
    target:addMod(MOD_VIT, 4);
    target:addMod(MOD_INT, 1);
    target:addMod(MOD_FOOD_DEFP, 25);
    target:addMod(MOD_FOOD_DEF_CAP, 100);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 20);
    target:delMod(MOD_DEX, 1);
    target:delMod(MOD_VIT, 4);
    target:delMod(MOD_INT, 1);
    target:delMod(MOD_FOOD_DEFP, 25);
    target:delMod(MOD_FOOD_DEF_CAP, 100);
end;
