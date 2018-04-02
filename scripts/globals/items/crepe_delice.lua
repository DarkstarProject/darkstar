-----------------------------------------
-- ID: 5767
-- Item: Crepe Delice
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- HP +10% (cap 15)
-- Magic Accuracy +21% (cap 30)
-- Magic Defense +2
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5767);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 10);
    target:addMod(MOD_FOOD_HP_CAP, 15);
    target:addMod(MOD_MDEF, 2);
    target:addMod(MOD_FOOD_MACCP, 21);
    target:addMod(MOD_FOOD_MACC_CAP, 30);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 10);
    target:delMod(MOD_FOOD_HP_CAP, 15);
    target:delMod(MOD_MDEF, 2);
    target:delMod(MOD_FOOD_MACCP, 21);
    target:delMod(MOD_FOOD_MACC_CAP, 30);
end;
