-----------------------------------------
-- ID: 6273
-- Item: fried_popoto_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP +35
-- VIT +3
-- Fire resistance +21
-- DEF +21% (cap 150)
-- Subtle Blow +9
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,6273);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 35);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_FIRERES, 21);
    target:addMod(MOD_FOOD_DEFP, 21);
    target:addMod(MOD_FOOD_DEF_CAP, 150);
    target:addMod(MOD_SUBTLE_BLOW, 9);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 35);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_FIRERES, 21);
    target:delMod(MOD_FOOD_DEFP, 21);
    target:delMod(MOD_FOOD_DEF_CAP, 150);
    target:delMod(MOD_SUBTLE_BLOW, 9);
end;
