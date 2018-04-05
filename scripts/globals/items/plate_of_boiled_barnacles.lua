-----------------------------------------
-- ID: 5980
-- Item: Plate of Boiled Barnacles
-- Food Effect: 30 Mins, All Races
-----------------------------------------
-- Charisma -3
-- Defense % 25 Cap 130
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5980);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_CHR, -3);
    target:addMod(MOD_FOOD_DEFP, 25);
    target:addMod(MOD_FOOD_DEF_CAP, 130);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_CHR, -3);
    target:delMod(MOD_FOOD_DEFP, 25);
    target:delMod(MOD_FOOD_DEF_CAP, 130);
end;
