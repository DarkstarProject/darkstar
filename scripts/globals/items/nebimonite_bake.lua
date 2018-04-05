-----------------------------------------
-- ID: 4459
-- Item: nebimonite_bake
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 1
-- Vitality 2
-- Defense % 25
-- Defense Cap 70
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,4459);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_DEX, 1);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_FOOD_DEFP, 25);
    target:addMod(MOD_FOOD_DEF_CAP, 70);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 1);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_FOOD_DEFP, 25);
    target:delMod(MOD_FOOD_DEF_CAP, 70);
end;
